#!/bin/env python
#-*-encoding:utf-8-*-

import sys

pv = 0

for line in sys.stdin:
    line = line.strip().split('\x01')
    pv += 1

print '%d'%(pv)
