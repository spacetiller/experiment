#!/usr/bin/python2.6 
# -*- coding: utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

for line in open('20150515.txt', 'r'):
    line = line.strip()
    block = line.split('\x01')
    if len(block) < 4:
        continue
    if 'URLS' in block[5]:
        continue
    else:
        print '%s'%(line)
