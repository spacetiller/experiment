#!/usr/bin/env python
# _*_ coding:utf-8 _*_

#from six.moves.configparser import ConfigParser
from configparser import ConfigParser

test_cfg = "./default.cfg"
config_raw = ConfigParser.RawConfigParser()
config_raw.read(test_cfg)

# 读取配置文件中 [DEFAULT]
defaults = config_raw.defaults()
print(defaults)

# 读取指定section下的value值
a_float = config_raw.getfloat('Section1', 'a_float')
print("-- number : %f type is : %s"%(a_float ,type(a_float)))

# 设置指定section下的value值
# 此时没有写入文件，保存在内存实例中
a_float = 2.14159
config_raw.set('Section1', 'a_float', a_float)
a_float = config_raw.getfloat('Section1', 'a_float')
print("-- number : %f type is : %s"%(a_float ,type(a_float)))

# 读取带有参数替换模板的变量，但是没有替换参数
print("-- RawConfigParser just get raw value")
str_foo = config_raw.get('Section1', 'foo')
print(str_foo)