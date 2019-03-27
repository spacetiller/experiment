#!/bin/env python
#-*-encoding:utf-8-*-


import sys
import jieba
import jieba.analyse

reload(sys)
sys.setdefaultencoding('utf-8') 


for line in sys.stdin:
    tmp_list = line.strip().split('\x01')
    if tmp_list == '':
        continue
    if len(tmp_list) < 14:
        continue
    else:
        #print tmp_list[13]
        #t = tmp_list[13].strip()
        #print '%s'%(t)
        search2word = jieba.analyse.extract_tags(tmp_list[13].upper())
        if len(search2word) == 0:
            continue
        if len(search2word) == 1:
            continue
        else:
            for se in search2word:
                #print "%s\t%s\t%s"%(search2word[0],search2word[1],search2word[2])
                print '%s\t%d'%(se,1)
