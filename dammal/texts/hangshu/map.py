#!/bin/env python
#-*-encoding:utf-8-*-

import sys

for line in sys.stdin:
    line = line.strip().split('\x01')
    if len(line) < 2:
        continue
    else:
        print '%s'%(line)
