#!/usr/bin/python
# -*- coding:utf8 -*-
import sys
from math import log
import re

reload(sys)
sys.setdefaultencoding('utf8')

import string
import re

for line in sys.stdin:
        if line.strip()=='':continue
        line=line.split('\01')
        if len(line)<12: continue
        url=line[10].strip()
        host=line[9].strip()
        #wordlist=line[4].strip()
        #if len(re.findall('人参',wordlist))+len(re.findall('绿豆',wordlist)) ==0:
        #        continue
        #print "%s\01%s"%(wordlist,"1")
        hosturl=host+url
        if hosturl.strip()=='':continue
        print "%s"%(hosturl)

