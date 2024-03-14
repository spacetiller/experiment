#!/usr/bin/python
#-*-coding:utf8-*-

import sys
reload(sys)
sys.setdefaultencoding('utf8')

last_word = ''
last_url=''
count = 0

for line in sys.stdin:
        line = line.strip()
        if line=='':continue
        url=line
        if url==last_url:
                continue
        print url
        last_url = url
