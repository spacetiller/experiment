# -*- encoding: utf-8 -*-

import hashlib, time;
from Crypto.Cipher import AES;	# python -m pip install pycryptodome

#定义欧几里得拓展算法，用来计算d
def ext_euclid ( a , b ):
     if (b == 0):
         return 1, 0, a
     else:
         x , y , q = ext_euclid( b , a % b )
         x , y = y, ( x - (a // b) * y )
         return x, y, q

p=7;
q=11;
N=p*q;
e=67;
pi=(p-1)*(q-1);

#需要备注的此处用了pi乘以2,如果只是单纯的pi求出来的结果为负数-19,不符合要求
d,y,q=ext_euclid(e,2*pi)

print "d,y,q=" ,d,y,q
print "N=" ,N
print "pi=" ,pi
print "d=" ,d

# 我们对75进行
e_r = (75^e) %N
print "对数字75加密后的结果:", e_r

# 将结果进行解密
d_r = (e_r^d) %N

print "解密的结果:", d_r
