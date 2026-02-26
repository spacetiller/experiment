"""
模型训练脚本 - 用于预测CI-模块
修正版：处理中文列名
"""

import pandas as pd
import numpy as np
import re
import pickle
import warnings
warnings.filterwarnings('ignore')

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.preprocessing import LabelEncoder
from sklearn.pipeline import Pipeline
from sklearn.ensemble import RandomForestClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report, accuracy_score


def load_data(file_path):
    """加载Excel数据并检查列名"""
    # 读取所有sheet
    xl = pd.ExcelFile(file_path)
    
    # 读取问题清单sheet
    df = pd.read_excel(file_path, sheet_name='问题清单')
    
    # 读取dict sheet
    dict_df = pd.read_excel(file_path, sheet_name='dict')
    
    print("问题清单列名:", df.columns.tolist()[:20])
    print("\ndict sheet列名:", dict_df.columns.tolist()[:20])
    
    # 尝试找到对应的列
    # 问题清单中需要：问题标题、CI-模块、O列
    title_col = None
    ci_module_col = None
    reporter_col = None
    
    for col in df.columns:
        col_str = str(col)
        if '问题标题' in col_str or '标题' in col_str:
            title_col = col
        elif 'CI-模块' in col_str or '模块' in col_str:
            ci_module_col = col
        elif col == 'O' or '备注' in col_str or '进展' in col_str:
            reporter_col = col
    
    print(f"\n找到的列 - 标题: {title_col}, CI-模块: {ci_module_col}, 提单人信息: {reporter_col}")
    
    # dict sheet中需要：CI-产品、CI-模块
    ci_product_col = None
    ci_module_dict_col = None
    
    for col in dict_df.columns:
        col_str = str(col)
        if 'CI-产品' in col_str or '产品' in col_str:
            ci_product_col = col
        elif 'CI-模块' in col_str or '模块' in col_str:
            ci_module_dict_col = col
    
    print(f"dict sheet - CI-产品: {ci_product_col}, CI-模块: {ci_module_dict_col}")
    
    # 构建映射
    if ci_product_col and ci_module_dict_col:
        ci_module_mapping = dict_df[[ci_product_col, ci_module_dict_col]].dropna()
        ci_module_mapping.columns = ['CI-产品', 'CI-模块']
    else:
        ci_module_mapping = pd.DataFrame()
    
    return df, ci_module_mapping, title_col, ci_module_col, reporter_col


def extract_reporter(text):
    """从文本中提取提单人姓名"""
    if pd.isna(text):
        return ''
    
    text = str(text)
    
    # 常见的提单人标识
    patterns = [
        r'提单人[：:]\s*([^\s\n]+)',
        r'提单人\s*([^\s\n]+)',
        r'创建人[：:]\s*([^\s\n]+)',
        r'创建人\s*([^\s\n]+)',
        r'经办人[：:]\s*([^\s\n]+)',
        r'经办人\s*([^\s\n]+)',
        r'申请人[：:]\s*([^\s\n]+)',
        r'申请人\s*([^\s\n]+)',
        r'提单[：:]\s*([^\s\n]+)',
    ]
    
    for pattern in patterns:
        match = re.search(pattern, text)
        if match:
            name = match.group(1).strip()
            if 2 <= len(name) <= 10 and re.search(r'[\u4e00-\u9fa5]', name):
                return name
    
    # 如果没有找到，取最后一段可能的名字
    lines = text.split('\n')
    for line in reversed(lines):
        line = line.strip()
        if 2 <= len(line) <= 10 and re.search(r'[\u4e00-\u9fa5]{2,4}', line):
            # 排除常见的非人名词语
            exclude_words = ['处理', '问题', '分析', '解决', '方案', '进展', '反馈', '用户', '确认']
            if not any(word in line for word in exclude_words):
                return line
    
    return ''


def preprocess_data(df, title_col, ci_module_col, reporter_col):
    """预处理数据，构建训练集"""
    if not all([title_col, ci_module_col, reporter_col]):
        print("缺少必要的列，无法训练")
        return pd.DataFrame()
    
    # 只保留有CI-模块的行
    train_df = df[df[ci_module_col].notna() & (df[ci_module_col] != '')].copy()
    
    if len(train_df) == 0:
        print("没有可用于训练的数据")
        return train_df
    
    # 提取提单人
    train_df['reporter'] = train_df[reporter_col].apply(extract_reporter)
    
    # 提取问题标题
    train_df['title_text'] = train_df[title_col].fillna('').astype(str)
    
    # 组合特征
    train_df['combined_text'] = train_df['title_text'] + ' ' + train_df['reporter']
    
    # 过滤掉类别样本太少的情况（少于3个样本）
    value_counts = train_df[ci_module_col].value_counts()
    valid_modules = value_counts[value_counts >= 3].index
    train_df = train_df[train_df[ci_module_col].isin(valid_modules)]
    
    print(f"训练数据数量: {len(train_df)}")
    print(f"有效类别数量: {len(valid_modules)}")
    print(f"类别分布:\n{train_df[ci_module_col].value_counts().head(15)}")
    
    return train_df


def train_model(train_df, ci_module_col):
    """训练分类模型"""
    if len(train_df) == 0:
        print("没有训练数据")
        return None, None
    
    X = train_df['combined_text'].values
    y = train_df[ci_module_col].values
    
    # 标签编码
    label_encoder = LabelEncoder()
    y_encoded = label_encoder.fit_transform(y)
    
    # 划分训练集和测试集
    X_train, X_test, y_train, y_test = train_test_split(
        X, y_encoded, test_size=0.2, random_state=42, stratify=y_encoded
    )
    
    print(f"训练集大小: {len(X_train)}")
    print(f"测试集大小: {len(X_test)}")
    
    # TF-IDF向量化
    tfidf = TfidfVectorizer(
        max_features=3000,
        ngram_range=(1, 2),
        min_df=2,
        max_df=0.8,
        sublinear_tf=True
    )
    
    # 随机森林分类器
    model = RandomForestClassifier(
        n_estimators=150,
        max_depth=15,
        min_samples_split=5,
        random_state=42,
        n_jobs=-1,
        class_weight='balanced'
    )
    
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
    print(f"\n准确率: {accuracy:.4f}")
    
    # 交叉验证
    cv_scores = cross_val_score(pipeline, X_train, y_train, cv=3)
    print(f"交叉验证平均准确率: {cv_scores.mean():.4f} (+/- {cv_scores.std() * 2:.4f})")
    
    # 详细报告
    print("\n分类报告:")
    print(classification_report(
        y_test, 
        y_pred, 
        target_names=label_encoder.classes_,
        zero_division=0
    ))
    
    return pipeline, label_encoder


def save_model(model, label_encoder, filepath='ci_module_model.pkl'):
    """保存模型到文件"""
    with open(filepath, 'wb') as f:
        pickle.dump({
            'model': model,
            'label_encoder': label_encoder
        }, f)
    print(f"模型已保存到 {filepath}")


def main():
    # 文件路径
    file_path = '问题登记表-20260210.xlsx'
    
    print("=" * 60)
    print("开始训练CI-模块预测模型")
    print("=" * 60)
    
    # 加载数据
    print("\n1. 加载数据...")
    df, ci_module_mapping, title_col, ci_module_col, reporter_col = load_data(file_path)
    
    # 预处理
    print("\n2. 预处理数据...")
    train_df = preprocess_data(df, title_col, ci_module_col, reporter_col)
    
    if len(train_df) < 10:
        print("训练数据太少，无法训练有效模型")
        return
    
    # 训练模型
    print("\n3. 训练模型...")
    model, label_encoder = train_model(train_df, ci_module_col)
    
    if model:
        # 保存模型
        print("\n4. 保存模型...")
        save_model(model, label_encoder)
        
        print("\n✅ 训练完成！")
        print(f"模型支持 {len(label_encoder.classes_)} 个模块")
        print("可用 predict.py 进行预测")
    else:
        print("❌ 训练失败")


if __name__ == "__main__":
    main()