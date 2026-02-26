"""
模型预测应用 - 用于预测新问题单的CI-模块
修正版：处理中文列名
"""

import sys
import io
import pandas as pd
import pickle
import re
import numpy as np
from scipy.sparse import hstack, csr_matrix

# 设置标准输出的编码为utf-8，兼容Windows命令行
if sys.platform.startswith('win'):
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='ignore')


class CIModulePredictorV2:
    """CI-模块预测器 v2"""
    
    def __init__(self, model_path='ci_module_model_v2.pkl'):
        with open(model_path, 'rb') as f:
            self.components = pickle.load(f)
        
        self.model = self.components['model']
        self.tfidf = self.components['tfidf']
        self.scaler = self.components['scaler']
        self.label_encoder = self.components['label_encoder']
        
        print(f"模型加载成功，支持 {len(self.label_encoder.classes_)} 个模块")
    
    def extract_reporter(self, text):
        """提取提单人"""
        if pd.isna(text):
            return ''
        text = str(text)
        patterns = [
            r'提单人[：:]\s*([^\s\n]+)',
            r'创建人[：:]\s*([^\s\n]+)',
            r'经办人[：:]\s*([^\s\n]+)',
        ]
        for pattern in patterns:
            match = re.search(pattern, text)
            if match:
                return match.group(1).strip()
        return ''
    
    def create_rule_features(self, title):
        """创建规则特征"""
        title = str(title).lower()
        
        return np.array([[
            min(len(title), 200),  # title_len
            1 if '发票' in title else 0,  # has_invoice
            1 if any(k in title for k in ['支付', '付款']) else 0,  # has_payment
            1 if any(k in title for k in ['资产', '折旧']) else 0,  # has_asset
            1 if any(k in title for k in ['凭证', '分录', '总账']) else 0,  # has_gl
            1 if any(k in title for k in ['预算', '占用']) else 0,  # has_budget
            1 if any(k in title for k in ['po', '采购订单']) else 0,  # has_po
            1 if any(k in title for k in ['pr', '采购需求']) else 0,  # has_pr
            1 if any(k in title for k in ['inv', '库存', '入库', '出库']) else 0,  # has_inv
            1 if any(k in title for k in ['人员', '员工', '考勤', '薪酬']) else 0,  # has_hr
            1 if any(k in title for k in ['流程', '审批', '待办']) else 0,  # has_workflow
        ]])
    
    def predict(self, title, reporter_text=None):
        """预测"""
        # 提取文本
        title = str(title)
        reporter = self.extract_reporter(reporter_text) if reporter_text else ''
        combined = title + ' ' + reporter
        
        # TF-IDF特征
        X_tfidf = self.tfidf.transform([combined])
        
        # 规则特征
        X_rules = self.create_rule_features(title)
        X_rules_scaled = self.scaler.transform(X_rules)
        
        # 合并特征
        X_combined = hstack([X_tfidf, csr_matrix(X_rules_scaled)])
        
        # 预测
        pred_id = self.model.predict(X_combined)[0]
        pred_module = self.label_encoder.inverse_transform([pred_id])[0]
        
        # 概率
        proba = self.model.predict_proba(X_combined)[0]
        
        # top5
        top5_indices = np.argsort(proba)[-5:][::-1]
        top5_modules = self.label_encoder.inverse_transform(top5_indices)
        top5_probs = proba[top5_indices]
        
        return {
            'predicted_module': pred_module,
            'probability': proba[pred_id],
            'top5': list(zip(top5_modules, top5_probs))
        }


def test_predictor():
    """测试预测器"""
    predictor = CIModulePredictorV2('ci_module_model_v2.pkl')
    
    test_cases = [
        {"title": "应付发票生成失败，预算控制异常", "reporter": "提单人：张三"},
        {"title": "库存会计期无法关闭，提示有在途单据", "reporter": "创建人：李四"},
        {"title": "采购订单创建失败，提示供应商信息失效", "reporter": ""},
        {"title": "人员信息维护无法保存，报权限错误", "reporter": "经办人：王五"},
        {"title": "资产折旧报表查询超时，无法打开", "reporter": "提单人：赵六"},
        {"title": "应付发票核销失败，无法撤核销", "reporter": "提单人：钱七"},
        {"title": "应收收款单生成分录失败", "reporter": "创建人：孙八"},
    ]
    
    print("\n预测结果:")
    print("-" * 80)
    for case in test_cases:
        result = predictor.predict(case["title"], case["reporter"])
        print(f"标题: {case['title'][:30]}...")
        print(f"预测: {result['predicted_module']} (置信度: {result['probability']:.2%})")
        
        if result['probability'] < 0.6:
            print("  候选:")
            for module, prob in result['top5'][:3]:
                print(f"    - {module}: {prob:.2%}")
        print()


if __name__ == "__main__":
    test_predictor()