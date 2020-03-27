#!/usr/bin/env python
# _*_ coding:utf-8 _*_

#from six.moves.configparser import ConfigParser
from configparser import ConfigParser

cp = ConfigParser()
cp.read("./default.cfg")

name = cp.get("DEFAULT", "default_name")
print(name)



# secs = cf.sections()  # 获取文件中所有的section(一个配置文件中可以有多个配置，如数据库相关的配置，邮箱相关的配置，每个section由[]包裹，即[section])，并以列表的形式返回
# print(secs)

# options = cf.options("Mysql-Database")  # 获取某个section名为Mysql-Database所对应的键
# print(options)

# items = cf.items("Mysql-Database")  # 获取section名为Mysql-Database所对应的全部键值对
# print(items)

# host = cf.get("Mysql-Database", "host")  # 获取[Mysql-Database]中host对应的值
# print(host)
