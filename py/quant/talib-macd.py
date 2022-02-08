#-*- coding:utf-8 -*-
import pandas as pd  
import numpy as np
import matplotlib.pyplot as plt
# %matplotlib inline   
# from IPython import get_ipython
# get_ipython().run_line_magic('matplotlib', 'inline')


#正常显示画图时出现的中文和负号
from pylab import mpl
mpl.rcParams['font.sans-serif']=['SimHei']
mpl.rcParams['axes.unicode_minus']=False

#引入TA-Lib库
import talib as ta

#查看包含的技术指标和数学运算函数
#print(ta.get_functions())
#print(ta.get_function_groups())

ta_fun=ta.get_function_groups()
ta_fun.keys()

#使用tushare获取上证指数数据作为示例
import tushare as ts
ts.set_token('a119134c895dca96f7caedef1de1fcf51409888f8df48aabf62c0399')
pro = ts.pro_api()
#df=ts.get_k_data('sh',start='2000-01-01')
df=pro.query('daily', ts_code='600519.SH', start_date='20100101', end_date='20211217')
#df.index=pd.to_datetime(df.date)
df.index=pd.to_datetime(df.trade_date)
df=df.sort_index()

# MACD
df['macd'], df['macdsignal'], df['macdhist'] = ta.MACD(df.close, fastperiod=12, slowperiod=26, signalperiod=9)
df[['close','macd','macdsignal','macdhist']].plot(figsize=(16,8),title='MACD', xlabel='date', ylabel='price')

plt.show()

