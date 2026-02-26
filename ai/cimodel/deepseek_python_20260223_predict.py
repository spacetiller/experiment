"""
模型预测应用 - 用于预测新问题单的CI-模块
"""

import pandas as pd
import pickle
import re
import numpy as np

class CIModulePredictor:
    """CI-模块预测器"""
    
    def __init__(self, model_path='ci_module_model.pkl'):
        """加载模型"""
        with open(model_path, 'rb') as f:
            data = pickle.load(f)
        self.model = data['model']
        self.label_encoder = data['label_encoder']
        print(f"模型加载成功，支持 {len(self.label_encoder.classes_)} 个模块")
    
    def extract_reporter(self, text):
        """从O列提取提单人"""
        if pd.isna(text):
            return ''
        text = str(text)
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
    
    def predict(self, title, reporter_text=None):
        """
        预测单个问题单的CI-模块
        
        参数:
            title: 问题标题 (B列)
            reporter_text: 提单人信息 (O列)，可选
        
        返回:
            predicted_module: 预测的CI-模块
            probabilities: 各模块概率
        """
        # 提取提单人
        reporter = self.extract_reporter(reporter_text) if reporter_text else ''
        
        # 组合文本
        combined = f"{title} {reporter}".strip()
        
        # 预测
        pred_id = self.model.predict([combined])[0]
        pred_module = self.label_encoder.inverse_transform([pred_id])[0]
        
        # 获取概率
        proba = self.model.predict_proba([combined])[0]
        
        # 获取top5
        top5_indices = np.argsort(proba)[-5:][::-1]
        top5_modules = self.label_encoder.inverse_transform(top5_indices)
        top5_probs = proba[top5_indices]
        
        return {
            'predicted_module': pred_module,
            'probability': proba[pred_id],
            'top5': list(zip(top5_modules, top5_probs))
        }
    
    def predict_batch(self, df):
        """
        批量预测DataFrame中的问题单
        
        参数:
            df: 包含'B'列(标题)和'O'列(提单人信息)的DataFrame
        
        返回:
            df_with_predictions: 添加预测列的DataFrame
        """
        results = df.copy()
        predictions = []
        probs = []
        
        for idx, row in results.iterrows():
            title = row.get('B', '')
            reporter_text = row.get('O', '')
            result = self.predict(title, reporter_text)
            predictions.append(result['predicted_module'])
            probs.append(result['probability'])
        
        results['预测CI-模块'] = predictions
        results['预测置信度'] = probs
        
        return results

# 使用示例
def example_usage():
    """使用示例"""
    
    # 初始化预测器
    predictor = CIModulePredictor('ci_module_model.pkl')
    
    # 示例1: 单个预测
    title = "应付发票生成失败，预算控制异常"
    reporter_text = "问题处理进展：已分析根因\n提单人：张三\n解决方案：待变更"
    
    result = predictor.predict(title, reporter_text)
    print(f"预测模块: {result['predicted_module']}")
    print(f"置信度: {result['probability']:.4f}")
    print("Top 5 候选:")
    for module, prob in result['top5']:
        print(f"  {module}: {prob:.4f}")
    
    # 示例2: 批量预测Excel文件
    # 读取新问题单
    # new_df = pd.read_excel('新问题单.xlsx')
    # predictions_df = predictor.predict_batch(new_df)
    # predictions_df.to_excel('预测结果.xlsx', index=False)
    
    # 示例3: 实时预测新问题
    new_cases = [
        {"title": "库存会计期无法关闭，提示有在途单据", "reporter": "提单人：李四"},
        {"title": "采购订单创建失败，提示供应商信息失效", "reporter": ""},
        {"title": "人员信息维护无法保存，报权限错误", "reporter": "创建人：王五"},
    ]
    
    for case in new_cases:
        result = predictor.predict(case["title"], case["reporter"])
        print(f"\n标题: {case['title']}")
        print(f"预测: {result['predicted_module']} (置信度: {result['probability']:.2f})")

# 预测并更新原始Excel的H列
def update_excel_with_predictions(input_file, output_file=None, model_path='ci_module_model.pkl'):
    """
    预测并更新原始Excel的H列
    
    参数:
        input_file: 输入的Excel文件路径
        output_file: 输出的Excel文件路径（如果为None，则覆盖原文件）
        model_path: 模型路径
    """
    import pandas as pd
    from openpyxl import load_workbook
    
    # 加载预测器
    predictor = CIModulePredictor(model_path)
    
    # 读取Excel
    df = pd.read_excel(input_file, sheet_name='问题清单')
    
    # 预测H列为空的行
    mask = df['H'].isna() | (df['H'] == '')
    
    if mask.sum() > 0:
        print(f"发现 {mask.sum()} 行需要预测")
        
        # 批量预测
        to_predict = df[mask].copy()
        predictions = []
        
        for idx, row in to_predict.iterrows():
            title = row.get('B', '')
            reporter_text = row.get('O', '')
            result = predictor.predict(title, reporter_text)
            predictions.append(result['predicted_module'])
        
        # 更新DataFrame
        df.loc[mask, 'H'] = predictions
        
        # 保存结果
        output = output_file or input_file
        with pd.ExcelWriter(output, engine='openpyxl') as writer:
            df.to_excel(writer, sheet_name='问题清单', index=False)
        
        print(f"预测完成，结果已保存到 {output}")
    else:
        print("所有行都已填充，无需预测")

if __name__ == "__main__":
    example_usage()
    # 如果需要更新原始文件，取消下面注释
    # update_excel_with_predictions('问题登记表-20260210.xlsx', '问题登记表-预测结果.xlsx')