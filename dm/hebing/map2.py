#!/bin/env python
#-*-encoding:utf-8-*-
import sys

for line in sys.stdin:
    line = line.strip()
    block = line.split('\x01')
    if len(block) < 6:
        continue
    if 'URLS' in block[5]:
        continue
    else:
        print '%s'%(line)
