"""
模型训练脚本 - 混合规则+机器学习模型
结合关键词匹配和机器学习
"""

import pandas as pd
import numpy as np
import re
import pickle
import warnings
warnings.filterwarnings('ignore')

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.pipeline import Pipeline
from sklearn.ensemble import RandomForestClassifier, GradientBoostingClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report, accuracy_score
from scipy.sparse import hstack, csr_matrix


# ==================== 关键词规则定义 ====================
# 每个CI-模块对应的关键词
MODULE_KEYWORDS = {
    # 财领域
    '应付': ['应付', '发票', '支付', '付款', '核销', 'AP', 'appay', 'invoice', 'payment'],
    '应收': ['应收', '收款', '核销', 'AR', 'receipt', 'collection'],
    '资产核算': ['资产', '折旧', '卡片', '摊销', 'FA', 'asset', 'depreciation'],
    '交易核算': ['分录', '凭证', '总账', '过账', 'GL', 'journal', 'voucher', 'ae'],
    '企业预算': ['预算', '控制', '占用', '释放', 'EB', 'budget', 'control'],
    '成本': ['成本', '计价', '移动平均', 'cost', 'valuation'],
    '财务智能分析': ['报表', '对账', '余额', '分析', 'finia', 'report'],
    '共享服务': ['共享', '派单', '工作组', '影像', 'HSS', 'shared'],
    '交易计税': ['计税', '税', 'tax', 'vat'],
    
    # 物领域
    '采购订单': ['采购订单', 'PO', '订单', 'purchase order'],
    '采购需求': ['采购需求', 'PR', '需求', '计划', 'purchase requisition'],
    '采购合同': ['合同', '采购合同', 'contract', 'agreement'],
    '库存': ['库存', '入库', '出库', '盘点', 'inv', 'inventory'],
    '供应商选择': ['供应商', '询价', '定标', 'supplier', 'sourcing'],
    '供应商主数据': ['供应商主数据', '供应商基础', 'supplier master'],
    '销售订单': ['销售订单', 'SO', '销售', '订单', 'sales order'],
    '产品主数据': ['物料', '产品', '物料主数据', 'item', 'material'],
    
    # 人领域
    'HR薪酬': ['薪酬', '工资', '薪资', 'payroll', 'salary'],
    'HR考勤': ['考勤', '请假', '加班', 'attendance', 'leave'],
    'HR CORE': ['人员', '员工', '入职', '离职', '调动', 'employee', 'person'],
    'HR入职': ['入职', 'onboarding'],
    'HR调动': ['调动', '借调', 'transfer'],
    
    # 技领域
    '轻应用编排（灵雀）': ['流程', '审批', '待办', '灵雀', 'workflow', 'approval'],
    'Meta实施工程': ['权限', '角色', '数据权限', 'permission', 'role'],
    'Meta用户权限': ['用户', '授权', '权限点', 'user', 'auth'],
    'Meta一站式门户': ['门户', '首页', '工作台', 'portal', 'dashboard'],
    'GCM-分析引擎': ['etl', '数据同步', '任务', 'flink'],
    'Liveflow': ['liveflow', '流程', '编排'],
    '企业文档管理（EDM）': ['附件', '文档', '上传', '下载', 'edm', 'attachment'],
    
    # 项领域
    '项控': ['项目', '项目预算', '项目成本', 'project'],
    
    # 其他
    '财务共享': ['共享', '派单', '影像', 'hss'],
    '业务底座': ['基础数据', '字典', '配置', 'master data'],
}


def load_data(file_path):
    """加载Excel数据"""
    xl = pd.ExcelFile(file_path)
    df = pd.read_excel(file_path, sheet_name='问题清单')
    dict_df = pd.read_excel(file_path, sheet_name='dict')
    
    # 查找列
    title_col = None
    module_col = None
    reporter_col = None
    
    for col in df.columns:
        col_str = str(col)
        if '问题标题' in col_str or '标题' in col_str:
            title_col = col
        elif 'CI-模块' in col_str or '模块' in col_str:
            module_col = col
        elif col == 'O' or '备注' in col_str or '进展' in col_str:
            reporter_col = col
    
    print(f"找到的列 - 标题: {title_col}, CI-模块: {module_col}, 提单人信息: {reporter_col}")
    
    return df, dict_df, title_col, module_col, reporter_col


def extract_reporter(text):
    """提取提单人"""
    if pd.isna(text):
        return ''
    text = str(text)
    
    patterns = [
        r'提单人[：:]\s*([^\s\n]+)',
        r'创建人[：:]\s*([^\s\n]+)',
        r'经办人[：:]\s*([^\s\n]+)',
        r'申请人[：:]\s*([^\s\n]+)',
    ]
    
    for pattern in patterns:
        match = re.search(pattern, text)
        if match:
            name = match.group(1).strip()
            if 2 <= len(name) <= 10 and re.search(r'[\u4e00-\u9fa5]', name):
                return name
    return ''


def extract_keywords_from_title(title):
    """从标题中提取关键词"""
    if pd.isna(title):
        return []
    title = str(title).lower()
    
    # 定义关键词
    keywords = []
    
    # 财经类关键词
    finance_keywords = ['应付', '应收', '发票', '支付', '付款', '核销', '资产', '折旧', '凭证', 
                        '分录', '总账', '预算', '成本', '报表', '对账', '计税', '共享']
    
    # 物类关键词
    supply_keywords = ['采购', '订单', '需求', '合同', '库存', '入库', '出库', '供应商', 
                       '物料', '销售', 'po', 'pr', 'so', 'inv']
    
    # 人类关键词
    hr_keywords = ['人员', '员工', '考勤', '薪酬', '工资', '入职', '离职', '调动', '请假']
    
    # 技术类关键词
    tech_keywords = ['流程', '审批', '待办', '权限', '角色', '附件', '文档', 'etl', '任务']
    
    for kw in finance_keywords:
        if kw in title:
            keywords.append(f'has_{kw}')
    
    for kw in supply_keywords:
        if kw in title:
            keywords.append(f'has_{kw}')
    
    for kw in hr_keywords:
        if kw in title:
            keywords.append(f'has_{kw}')
    
    for kw in tech_keywords:
        if kw in title:
            keywords.append(f'has_{kw}')
    
    return keywords


def calculate_module_keyword_match(title, module):
    """计算标题与模块关键词的匹配得分"""
    if pd.isna(title) or pd.isna(module):
        return 0
    
    title = str(title).lower()
    module_str = str(module)
    
    # 如果标题直接包含模块名
    if module_str in title:
        return 1.0
    
    # 如果模块有预定义关键词
    for key, keywords in MODULE_KEYWORDS.items():
        if key in module_str:
            for kw in keywords:
                if kw in title:
                    return 0.8
    
    return 0


def create_feature_vector(df, title_col, reporter_col):
    """创建特征向量"""
    features = []
    rule_scores = []
    
    for idx, row in df.iterrows():
        title = str(row[title_col]) if pd.notna(row[title_col]) else ''
        reporter = extract_reporter(row[reporter_col]) if pd.notna(row[reporter_col]) else ''
        
        # 规则1: 标题长度
        title_len = min(len(title), 200)
        
        # 规则2: 是否包含特定关键词
        has_invoice = 1 if '发票' in title else 0
        has_payment = 1 if any(k in title for k in ['支付', '付款']) else 0
        has_asset = 1 if any(k in title for k in ['资产', '折旧']) else 0
        has_gl = 1 if any(k in title for k in ['凭证', '分录', '总账']) else 0
        has_budget = 1 if any(k in title for k in ['预算', '占用']) else 0
        has_po = 1 if any(k in title.lower() for k in ['po', '采购订单']) else 0
        has_pr = 1 if any(k in title.lower() for k in ['pr', '采购需求']) else 0
        has_inv = 1 if any(k in title.lower() for k in ['inv', '库存', '入库', '出库']) else 0
        has_hr = 1 if any(k in title for k in ['人员', '员工', '考勤', '薪酬']) else 0
        has_workflow = 1 if any(k in title for k in ['流程', '审批', '待办']) else 0
        
        feature_row = [
            title_len, has_invoice, has_payment, has_asset, has_gl, 
            has_budget, has_po, has_pr, has_inv, has_hr, has_workflow
        ]
        features.append(feature_row)
    
    return np.array(features)


def train_model(train_df, title_col, module_col, reporter_col):
    """训练混合模型"""
    if len(train_df) < 10:
        print("训练数据太少")
        return None, None
    
    # 准备数据
    X_text = train_df[title_col].fillna('').astype(str).values
    y = train_df[module_col].values
    
    # 过滤低频类别
    value_counts = pd.Series(y).value_counts()
    valid_modules = value_counts[value_counts >= 3].index
    mask = pd.Series(y).isin(valid_modules)
    X_text = X_text[mask]
    y = y[mask]
    
    if len(X_text) == 0:
        print("没有有效数据")
        return None, None
    
    # 标签编码
    label_encoder = LabelEncoder()
    y_encoded = label_encoder.fit_transform(y)
    
    # 划分数据集
    X_train_text, X_test_text, y_train, y_test = train_test_split(
        X_text, y_encoded, test_size=0.2, random_state=42, stratify=y_encoded
    )
    
    # 1. TF-IDF特征
    tfidf = TfidfVectorizer(
        max_features=2000,
        ngram_range=(1, 2),
        min_df=2,
        max_df=0.8
    )
    X_train_tfidf = tfidf.fit_transform(X_train_text)
    X_test_tfidf = tfidf.transform(X_test_text)
    
    # 2. 规则特征
    train_df_subset = train_df[mask].iloc[train_test_split(range(len(X_text)), test_size=0.2, random_state=42)[0]]
    test_df_subset = train_df[mask].iloc[train_test_split(range(len(X_text)), test_size=0.2, random_state=42)[1]]
    
    X_train_rules = create_feature_vector(train_df_subset, title_col, reporter_col)
    X_test_rules = create_feature_vector(test_df_subset, title_col, reporter_col)
    
    # 缩放规则特征
    scaler = StandardScaler()
    X_train_rules_scaled = scaler.fit_transform(X_train_rules)
    X_test_rules_scaled = scaler.transform(X_test_rules)
    
    # 合并特征
    from scipy.sparse import hstack, csr_matrix
    X_train_combined = hstack([X_train_tfidf, csr_matrix(X_train_rules_scaled)])
    X_test_combined = hstack([X_test_tfidf, csr_matrix(X_test_rules_scaled)])
    
    # 训练多个模型
    models = {
        'RandomForest': RandomForestClassifier(
            n_estimators=200,
            max_depth=20,
            min_samples_split=5,
            random_state=42,
            n_jobs=-1,
            class_weight='balanced'
        ),
        'GradientBoosting': GradientBoostingClassifier(
            n_estimators=150,
            max_depth=6,
            learning_rate=0.1,
            random_state=42
        ),
        'LogisticRegression': LogisticRegression(
            C=2.0,
            max_iter=1000,
            multi_class='multinomial',
            random_state=42,
            class_weight='balanced'
        )
    }
    
    best_model = None
    best_score = 0
    best_name = ""
    
    print("\n训练多个模型...")
    for name, model in models.items():
        model.fit(X_train_combined, y_train)
        y_pred = model.predict(X_test_combined)
        accuracy = accuracy_score(y_test, y_pred)
        print(f"{name}: {accuracy:.4f}")
        
        if accuracy > best_score:
            best_score = accuracy
            best_model = model
            best_name = name
    
    print(f"\n最佳模型: {best_name} (准确率: {best_score:.4f})")
    
    # 详细报告
    y_pred_best = best_model.predict(X_test_combined)
    print("\n分类报告:")
    print(classification_report(y_test, y_pred_best, target_names=label_encoder.classes_, zero_division=0))
    
    # 特征重要性（如果是树模型）
    if hasattr(best_model, 'feature_importances_'):
        importances = best_model.feature_importances_
        tfidf_features = tfidf.get_feature_names_out() if hasattr(tfidf, 'get_feature_names_out') else []
        rule_features = ['title_len', 'has_invoice', 'has_payment', 'has_asset', 'has_gl', 
                         'has_budget', 'has_po', 'has_pr', 'has_inv', 'has_hr', 'has_workflow']
        
        # 显示top20重要特征
        feature_names = list(tfidf_features) + rule_features
        if len(importances) == len(feature_names):
            top_indices = np.argsort(importances)[-20:][::-1]
            print("\nTop 20 重要特征:")
            for idx in top_indices:
                print(f"  {feature_names[idx]}: {importances[idx]:.4f}")
    
    return {
        'model': best_model,
        'tfidf': tfidf,
        'scaler': scaler,
        'label_encoder': label_encoder,
        'model_name': best_name
    }


def save_model(model_components, filepath='ci_module_model_v2.pkl'):
    """保存模型"""
    with open(filepath, 'wb') as f:
        pickle.dump(model_components, f)
    print(f"模型已保存到 {filepath}")


def main():
    file_path = '问题登记表-20260210.xlsx'
    
    print("=" * 60)
    print("开始训练CI-模块预测模型 v2 (混合模型)")
    print("=" * 60)
    
    # 加载数据
    print("\n1. 加载数据...")
    df, dict_df, title_col, module_col, reporter_col = load_data(file_path)
    
    if not all([title_col, module_col, reporter_col]):
        print("错误: 缺少必要列")
        return
    
    # 查看数据分布
    print(f"\n总数据行数: {len(df)}")
    print(f"有CI-模块的行数: {df[module_col].notna().sum()}")
    
    # 训练模型
    print("\n2. 训练混合模型...")
    model_components = train_model(df, title_col, module_col, reporter_col)
    
    if model_components:
        # 保存模型
        save_model(model_components)
        print(f"\n✅ 训练完成！模型支持 {len(model_components['label_encoder'].classes_)} 个模块")
    else:
        print("❌ 训练失败")


if __name__ == "__main__":
    main()