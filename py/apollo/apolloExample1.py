#! /usr/bin/env python3
#-*- coding:utf-8 -*- 

import pyapollo

a = pyapollo.ApolloClient("bi-marketing-platform-biz-impl","default","http://apollo-meta-pro.svc.tunaikita.id:8080")
a.start()

#for key in ["mysql.url","mysql.username","appsFlyer.api.url","google.api.loginCustomerId"]:
for key in ["appsFlyer.api.url","google.api.loginCustomerId"]:
	v = a.get_value(key)
	print("%s : " % key)
	print(v)
