# -*- encoding: utf-8 -*-

import hashlib, time;
from Crypto.Cipher import AES;	# python -m pip install pycryptodome

#����ŷ�������չ�㷨����������d
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

#��Ҫ��ע�Ĵ˴�����pi����2,���ֻ�ǵ�����pi������Ľ��Ϊ����-19,������Ҫ��
d,y,q=ext_euclid(e,2*pi)

print "d,y,q=" ,d,y,q
print "N=" ,N
print "pi=" ,pi
print "d=" ,d

# ���Ƕ�75����
e_r = (75^e) %N
print "������75���ܺ�Ľ��:", e_r

# ��������н���
d_r = (e_r^d) %N

print "���ܵĽ��:", d_r
