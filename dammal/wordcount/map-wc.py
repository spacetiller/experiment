#!/usr/bin/env python
#-*-encoding:utf-8-*-
import sys
for line in sys.stdin:
    line = line.strip()
    words = line.split('\x01')
    for word in words:
        print "%s\t%s" % (word, 1)
