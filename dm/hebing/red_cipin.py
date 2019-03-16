#!/bin/env python
#-*-encoding:utf-8-*-

import sys

word = ''
pv = 0
dic = {}
dic2 = {}
for line in sys.stdin:
    line = line.strip().split('\t')
    if word != line[0]:
        if word != '':
            dic.setdefault(word,pv)
        word = line[0]
        pv = 0
    pv += 1

if word != '':
    dic.setdefault(word,pv)

dic2 = sorted(dic.iteritems(),key=lambda asd:asd[1],reverse = True) 
for k,v in dic2:
    print '%s\t%d'%(k,v)
