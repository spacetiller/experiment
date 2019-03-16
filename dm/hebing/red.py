#!/bin/env python
#-*-encoding:utf-8-*-

import sys
from operator import itemgetter, attrgetter  

l = []
for line in sys.stdin:
    line = line.strip().split('\x01')
    if line[0].find(':') != -1:
        l.append(line[0])

l.sort(key=lambda x:x[0])
print l
