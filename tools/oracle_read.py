#!/bin/env python
#-*- coding: UTF-8 -*- 

import cx_Oracle
import os 
import sys

#防止oracle乱码
os.environ['NLS_LANG'] = 'SIMPLIFIED CHINESE_CHINA.UTF8'

#用户名
#print 'please input oracle username'
ouser='reader' #raw_input()
#密码
#print 'input oracle  password'
opass='YqQFQJfHKcl4Y9kz' #raw_input()
#查询语句
if len(sys.argv) == 1:
    print 'please input query sql'
    querySQL=raw_input()
    datafile='data.txt'
elif len(sys.argv) == 2:
    querySQL = sys.argv[1]
    datafile='data.txt'
elif len(sys.argv) == 3:
    querySQL = sys.argv[1]
    datafile = sys.argv[2] + ".txt"
else:
    print 'Usage: #this "SQL" "OUT_FILE"'
    exit(1)
#定义变量
output=None
db=None
cursor=None

#异常捕获 释放资源
try:
    #创建数据库连接
    db=cx_Oracle.connect(ouser,opass,'10.60.8.61:1521/yypt')
    #创建游标
    cursor=db.cursor()
    #执行sql语句
    cursor.execute(querySQL)
    #打开文件
    output = open(datafile, 'w')
    #循环读入数据并写入文件
    while 1>0:
        row=cursor.fetchone()
    #如果为None则break
        if(row==None):
            break
        colcount=len(row)
        for index in range(colcount):
            #如果column为null 则不输出
            if(row[index]!=None):
                output.write(str(row[index]).strip().replace('\n','').replace('\r','').replace(',','|'))
            #如果不是最后一列则输出一个','
            if(index<colcount-1):
                output.write(',')
        output.write('\n')
except Exception, e:
    print e
finally:
    #关闭资源
    if(cursor!=None):
        cursor.close()
    if(db!=None):
        db.close()
    if(output!=None):
        output.close()
