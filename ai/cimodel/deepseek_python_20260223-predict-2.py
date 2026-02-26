"""
模型预测应用 - 用于预测新问题单的CI-模块
修正版：处理中文列名
"""

import pandas as pd
import pickle
import re
import numpy as np


class CIModulePredictor:
    """CI-模块预测器"""
    
    def __init__(self, model_path='ci_module_model.pkl'):
        """加载模型"""
        try:
            with open(model_path, 'rb') as f:
                data = pickle.load(f)
            self.model = data['model']
            self.label_encoder = data['label_encoder']
            print(f"✅ 模型加载成功，支持 {len(self.label_encoder.classes_)} 个模块")
            print(f"模块列表: {', '.join(self.label_encoder.classes_[:10])}...")
        except FileNotFoundError:
            print(f"❌ 模型文件 {model_path} 不存在，请先运行训练脚本")
            self.model = None
            self.label_encoder = None
    
    def extract_reporter(self, text):
        """从文本中提取提单人"""
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
        ]
        
        for pattern in patterns:
            match = re.search(pattern, text)
            if match:
                name = match.group(1).strip()
                if 2 <= len(name) <= 10 and re.search(r'[\u4e00-\u9fa5]', name):
                    return name
        
        # 取最后一段可能的名字
        lines = text.split('\n')
        for line in reversed(lines):
            line = line.strip()
            if 2 <= len(line) <= 10 and re.search(r'[\u4e00-\u9fa5]{2,4}', line):
                exclude_words = ['处理', '问题', '分析', '解决', '方案', '进展']
                if not any(word in line for word in exclude_words):
                    return line
        
        return ''
    
    def predict(self, title, reporter_text=None):
        """
        预测单个问题单的CI-模块
        """
        if self.model is None:
            return {'error': '模型未加载'}
        
        # 提取提单人
        reporter = self.extract_reporter(reporter_text) if reporter_text else ''
        
        # 组合文本
        combined = f"{title} {reporter}".strip()
        
        if not combined:
            return {'error': '输入为空'}
        
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
    
    def predict_batch(self, df, title_col=None, reporter_col=None):
        """
        批量预测DataFrame中的问题单
        """
        if self.model is None:
            return df
        
        results = df.copy()
        predictions = []
        probs = []
        
        # 自动查找列名
        if title_col is None:
            for col in df.columns:
                if '问题标题' in str(col) or '标题' in str(col):
                    title_col = col
                    break
            if title_col is None:
                title_col = df.columns[1]  # 假设第二列是标题
        
        if reporter_col is None:
            for col in df.columns:
                if '备注' in str(col) or '进展' in str(col):
                    reporter_col = col
                    break
            if reporter_col is None:
                reporter_col = df.columns[15] if len(df.columns) > 15 else None
        
        print(f"使用标题列: {title_col}")
        print(f"使用提单人信息列: {reporter_col}")
        
        for idx, row in results.iterrows():
            title = row.get(title_col, '')
            reporter_text = row.get(reporter_col, '') if reporter_col else ''
            
            if pd.isna(title):
                title = ''
            
            result = self.predict(str(title), str(reporter_text))
            
            if 'error' in result:
                predictions.append('')
                probs.append(0)
            else:
                predictions.append(result['predicted_module'])
                probs.append(result['probability'])
        
        results['预测CI-模块'] = predictions
        results['预测置信度'] = probs
        
        return results


def example_usage():
    """使用示例"""
    print("=" * 60)
    print("CI-模块预测示例")
    print("=" * 60)
    
    # 初始化预测器
    predictor = CIModulePredictor('ci_module_model.pkl')
    
    if predictor.model is None:
        return
    
    # 测试用例
    test_cases = [
        {
            "title": "应付发票生成失败，预算控制异常",
            "reporter": "问题处理进展：已分析根因\n提单人：张三\n解决方案：待变更"
        },
        {
            "title": "库存会计期无法关闭，提示有在途单据",
            "reporter": "创建人：李四"
        },
        {
            "title": "采购订单创建失败，提示供应商信息失效",
            "reporter": ""
        },
        {
            "title": "人员信息维护无法保存，报权限错误",
            "reporter": "经办人：王五"
        },
        {
            "title": "资产折旧报表查询超时，无法打开",
            "reporter": "提单人：赵六"
        }
    ]
    
    print("\n预测结果:")
    print("-" * 60)
    
    for i, case in enumerate(test_cases, 1):
        result = predictor.predict(case["title"], case["reporter"])
        
        if 'error' in result:
            print(f"{i}. ❌ {case['title'][:30]}... 预测失败")
        else:
            print(f"{i}. 📌 {case['title'][:30]}...")
            print(f"   预测: {result['predicted_module']} "
                  f"(置信度: {result['probability']:.2%})")
            
            if result['probability'] < 0.6:
                print("   候选:")
                for module, prob in result['top5'][:3]:
                    print(f"     - {module}: {prob:.2%}")
        print()


def update_excel(input_file, output_file=None, model_path='ci_module_model.pkl'):
    """
    预测并更新Excel文件中的H列
    """
    print("=" * 60)
    print("批量预测Excel文件")
    print("=" * 60)
    
    # 加载预测器
    predictor = CIModulePredictor(model_path)
    
    if predictor.model is None:
        return
    
    # 读取Excel
    df = pd.read_excel(input_file, sheet_name='问题清单')
    
    print(f"原始数据: {len(df)} 行")
    print(f"列名: {df.columns.tolist()[:10]}")
    
    # 查找H列（CI-模块）
    h_col = None
    for col in df.columns:
        if 'CI-模块' in str(col) or '模块' in str(col) or col == 'H':
            h_col = col
            break
    
    if h_col is None:
        print("未找到CI-模块列，使用第8列（H）")
        h_col = df.columns[7] if len(df.columns) > 7 else None
    
    print(f"目标列: {h_col}")
    
    # 预测H列为空的行
    mask = df[h_col].isna() | (df[h_col] == '') if h_col else pd.Series([True] * len(df))
    
    if mask.sum() > 0:
        print(f"\n发现 {mask.sum()} 行需要预测")
        
        # 批量预测
        to_predict = df[mask].copy()
        results_df = predictor.predict_batch(to_predict)
        
        # 更新原DataFrame
        df.loc[mask, h_col] = results_df['预测CI-模块'].values
        df.loc[mask, '预测置信度'] = results_df['预测置信度'].values
        
        # 保存结果
        output = output_file or input_file.replace('.xlsx', '_预测结果.xlsx')
        
        with pd.ExcelWriter(output, engine='openpyxl') as writer:
            df.to_excel(writer, sheet_name='问题清单', index=False)
        
        print(f"\n✅ 预测完成，结果已保存到: {output}")
        print(f"   共更新 {mask.sum()} 行")
    else:
        print("所有行都已填充，无需预测")


if __name__ == "__main__":
    # 示例用法
    example_usage()
    
    # 如果需要更新原始文件，取消下面注释
    # update_excel('问题登记表-20260210.xlsx')