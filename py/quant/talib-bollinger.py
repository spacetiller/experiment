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

# BBANDS
H_line,M_line,L_line=ta.BBANDS(df.close, timeperiod=20, nbdevup=2, nbdevdn=2, matype=0)
df1=pd.DataFrame(df.close,index=df.index,columns=['close'])
df1['H_line']=H_line
df1['M_line']=M_line
df1['L_line']=L_line

df1.loc['2021-01-01':].plot(figsize=(16,6),title='Bollinger Bands', xlabel='date', ylabel='price')

plt.show()

