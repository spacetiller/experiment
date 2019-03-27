#!/bin/env python
#-*-encoding:utf-8-*-

import sys

for line in sys.stdin:
    line = line.strip().split('\x01')
    if len(line) < 14:
        continue
    try:
        if len(line[19]) == 0:
            continue
        if 'http' in line[19]:
            continue
        else:
            print '%s\n' %(line[19])     #text文本内容
  
    except Exception as e:
        continue
