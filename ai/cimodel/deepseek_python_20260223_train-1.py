"""
模型训练脚本 - 用于预测CI-模块
"""

import pandas as pd
import numpy as np
import re
import pickle
import warnings
warnings.filterwarnings('ignore')

# 数据处理
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.preprocessing import LabelEncoder
from sklearn.pipeline import Pipeline
from sklearn.compose import ColumnTransformer
from sklearn.multioutput import MultiOutputClassifier

# 分类模型
from sklearn.ensemble import RandomForestClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from sklearn.naive_bayes import MultinomialNB

# 评估
from sklearn.metrics import classification_report, accuracy_score, confusion_matrix

# 读取数据
def load_data(file_path):
    """加载Excel数据"""
    df = pd.read_excel(file_path, sheet_name='问题清单')
    dict_df = pd.read_excel(file_path, sheet_name='dict')
    
    # 获取CI-模块映射表
    ci_module_mapping = dict_df[['C', 'H']].dropna().rename(
        columns={'C': 'CI-产品', 'H': 'CI-模块'}
    )
    
    return df, ci_module_mapping

# 数据预处理
def preprocess_data(df, ci_module_mapping):
    """
    预处理数据，构建训练集
    """
    # 只保留有CI-模块的行
    train_df = df[df['H'].notna() & (df['H'] != '')].copy()
    
    # 提取提单人姓名（从O列最后一行）
    def extract_reporter(text):
        if pd.isna(text):
            return ''
        text = str(text)
        # 查找 "提单人：" 或 "提单人" 后面的姓名
        patterns = [
            r'提单人[：:]\s*([^\s]+)',
            r'提单人\s*([^\s]+)',
            r'创建人[：:]\s*([^\s]+)',
            r'创建人\s*([^\s]+)'
        ]
        for pattern in patterns:
            match = re.search(pattern, text)
            if match:
                return match.group(1).strip()
        # 如果没有找到，取最后一段可能的名字
        lines = text.split('\n')
        for line in reversed(lines):
            if len(line.strip()) < 15 and re.search(r'[\u4e00-\u9fa5]{2,4}', line):
                return line.strip()
        return ''
    
    train_df['reporter'] = train_df['O'].apply(extract_reporter)
    
    # 提取问题标题文本
    train_df['title_text'] = train_df['B'].fillna('')
    
    # 组合特征：标题 + 提单人
    train_df['combined_text'] = train_df['title_text'] + ' ' + train_df['reporter']
    
    # 过滤无效类别
    train_df = train_df[train_df['H'].isin(ci_module_mapping['CI-模块'].values)]
    
    print(f"训练数据数量: {len(train_df)}")
    print(f"类别数量: {train_df['H'].nunique()}")
    print(f"类别分布:\n{train_df['H'].value_counts().head(20)}")
    
    return train_df

# 特征工程和模型训练
def train_model(train_df):
    """
    训练分类模型
    """
    # 准备特征和标签
    X = train_df['combined_text'].values
    y = train_df['H'].values
    
    # 标签编码
    label_encoder = LabelEncoder()
    y_encoded = label_encoder.fit_transform(y)
    
    # 划分训练集和测试集
    X_train, X_test, y_train, y_test = train_test_split(
        X, y_encoded, test_size=0.2, random_state=42, stratify=y_encoded
    )
    
    print(f"训练集大小: {len(X_train)}")
    print(f"测试集大小: {len(X_test)}")
    
    # 创建TF-IDF向量器
    tfidf = TfidfVectorizer(
        max_features=5000,
        ngram_range=(1, 3),
        min_df=2,
        max_df=0.8,
        sublinear_tf=True
    )
    
    # 尝试多个模型
    models = {
        'RandomForest': RandomForestClassifier(
            n_estimators=200,
            max_depth=20,
            min_samples_split=5,
            random_state=42,
            n_jobs=-1
        ),
        'LogisticRegression': LogisticRegression(
            C=5.0,
            max_iter=1000,
            multi_class='multinomial',
            random_state=42,
            n_jobs=-1
        ),
        'SVM': SVC(
            C=2.0,
            kernel='linear',
            probability=True,
            random_state=42
        )
    }
    
    best_model = None
    best_score = 0
    best_vectorizer = None
    
    for name, model in models.items():
        # 创建pipeline
        pipeline = Pipeline([
            ('tfidf', tfidf),
            ('clf', model)
        ])
        
        # 训练
        pipeline.fit(X_train, y_train)
        
        # 预测
        y_pred = pipeline.predict(X_test)
        
        # 评估
        accuracy = accuracy_score(y_test, y_pred)
        print(f"\n{name} 准确率: {accuracy:.4f}")
        
        # 交叉验证
        cv_scores = cross_val_score(pipeline, X_train, y_train, cv=5)
        print(f"{name} 交叉验证平均准确率: {cv_scores.mean():.4f} (+/- {cv_scores.std() * 2:.4f})")
        
        if accuracy > best_score:
            best_score = accuracy
            best_model = pipeline
            best_vectorizer = tfidf
    
    print(f"\n最佳模型准确率: {best_score:.4f}")
    
    # 在测试集上详细评估最佳模型
    y_pred_best = best_model.predict(X_test)
    print("\n分类报告:")
    print(classification_report(
        y_test, 
        y_pred_best, 
        target_names=label_encoder.classes_,
        zero_division=0
    ))
    
    return best_model, label_encoder, best_vectorizer

# 保存模型
def save_model(model, label_encoder, vectorizer, filepath='ci_module_model.pkl'):
    """保存模型到文件"""
    with open(filepath, 'wb') as f:
        pickle.dump({
            'model': model,
            'label_encoder': label_encoder,
            'vectorizer': vectorizer
        }, f)
    print(f"模型已保存到 {filepath}")

# 主训练函数
def main():
    # 加载数据
    print("正在加载数据...")
    df, ci_module_mapping = load_data('问题登记表-20260210.xlsx')
    
    # 预处理
    print("正在预处理数据...")
    train_df = preprocess_data(df, ci_module_mapping)
    
    # 训练模型
    print("正在训练模型...")
    model, label_encoder, vectorizer = train_model(train_df)
    
    # 保存模型
    save_model(model, label_encoder, vectorizer)
    
    print("训练完成！")

if __name__ == "__main__":
    main()