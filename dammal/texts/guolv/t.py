#!/bin/env python
#-*-encoding:utf-8-*-


import glob
f = open('20150518.txt','a')
for filename in glob.glob(r'/home/work/data/246/log/parse.log.20150518*'):
    print filename
    #f = open('new','a')
    
    for i in open(filename,'r'):
        #print i
        f.write(i + '\n')


for filename2 in glob.glob(r'/home/work/data/248/log/parse.log.20150518*'):
    for i in open(filename2,'r'):
        f.write(i + '\n')
    

for filename3 in glob.glob(r'/home/work/radar/crawler_v1r1b003/log/parse.log.20150518*'):
    for i in open(filename3,'r'):
        f.write(i + '\n')
f.close()

for line in open('20150518.txt', 'r'): 
    line = line.strip() 
    block = line.split('\x01')   

    if len(block) < 4:
        continue
    if 'URLS' in black[5]:
        continue
    else:
        print '%s'%(line)
