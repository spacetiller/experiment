#!/bin/env python
#-*-encoding:utf-8-*-
import sys

for line in sys.stdin:
    line = line.strip()
    block = line.split('\x01')
    if len(block) < 6:
        continue
    if 'TEXT' in block[5]:
        print '%s'%("我是中文")
        for ele in block:
            print '%s'%(ele.encode("utf-8"))
