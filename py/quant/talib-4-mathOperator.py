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

#最高价与最低价之和
df['add']=ta.ADD(df.high,df.low)
#最高价与最低价之差
df['sub']=ta.SUB(df.high,df.low)
#最高价与最低价之乘
df['mult']=ta.MULT(df.high,df.low)
#最高价与最低价之除
df['div']=ta.DIV(df.high,df.low)
#收盘价的每30日移动求和
df['sum']=ta.SUM(df.close, timeperiod=30)
#收盘价的每30日内的最大最小值
df['min'], df['max'] = ta.MINMAX(df.close, timeperiod=30)
#收盘价的每30日内的最大最小值对应的索引值（第N行）
df['minidx'], df['maxidx'] = ta.MINMAXINDEX(df.close, timeperiod=30)
df.tail()

#将上述函数计算得到的结果进行可视化
df[['close','add','sub','mult','div','sum','min','max']].plot(figsize=(12,10),
       subplots = True,
       layout=(4, 2))
plt.subplots_adjust(wspace=0,hspace=0.2)
plt.show()

