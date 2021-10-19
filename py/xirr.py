# -*- coding=utf-8 -*-
# __author = 'zhanghui'__

import datetime
from scipy import optimize
 
# 函数
def xnpv(rate, cashflows):
    return sum([cf/(1+rate)**((t-cashflows[0][0]).days/365.0) for (t,cf) in cashflows])
 
def xirr(cashflows, guess=0.1):
    try:
        res = optimize.newton(lambda r: xnpv(r,cashflows),guess)
        print(res)
        return res
    except:
        print('Calc Wrong')
 
 
# 测试
data = [(datetime.date(2006, 1, 24), -39967), (datetime.date(2008, 2, 6), -19866), (datetime.date(2010, 10, 18), 245706), (datetime.date(2013, 9, 14), 52142)]
print(data)
xirr(data)
