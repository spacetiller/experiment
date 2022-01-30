import pandas as pd  
import numpy as np
import matplotlib.pyplot as plt
# %matplotlib inline   

#正常显示画图时出现的中文和负号
from pylab import mpl
mpl.rcParams['font.sans-serif']=['SimHei']
mpl.rcParams['axes.unicode_minus']=False

#引入TA-Lib库
import talib as ta

#获取交易数据用于示例分析
import tushare as ts
def get_data(code,start='2015-01-01'):
    df=ts.get_k_data(code,start)
    df.index=pd.to_datetime(df.date)
    df=df.sort_index()
    return df

#获取上证指数收盘价、最高、最低价格
df=get_data('sh')[['open','close','high','low']]

df['sin']=ta.SIN(df.close)
df['cos']=ta.COS(df.close)
df['ln']=ta.LN(df.close)
#将上述函数计算得到的结果进行可视化
df[['close','sin','cos','ln']].plot(figsize=(12,8),
       subplots = True,layout=(2, 2))
plt.subplots_adjust(wspace=0,hspace=0.2)

plt.show()

