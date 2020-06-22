#! /usr/bin/env/Python
# -*- coding:utf-8 -*-

from xmlrpclib import ServerProxy            #导入xmlrpclib的包 
s = ServerProxy("http://127.0.0.1:8077") #定义xmlrpc客户端 
print(s.fun_add(2,3))
