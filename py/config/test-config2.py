#!/usr/bin/env python
# _*_ coding:utf-8 _*_

#from six.moves.configparser import ConfigParser
from configparser import ConfigParser

test_cfg = "./default.cfg"
config = ConfigParser.ConfigParser()
config.read(test_cfg)

print("-- ConfigParser can get interpolation")
## get 接口添加参数 raw，raw=1 时直接返回配置文件中的值，不做参数替换
## raw 默认为0，设置为0时，返回替换后的值
str_foo = config.get('Section1', 'foo', raw=1)
#等同 str_foo = config.get('Section1', 'foo', 1)
print(str_foo)
str_foo = config.get('Section1', 'foo')
print(str_foo)
str_foo = config.get('Section1', 'foo', 0)
print(str_foo)

print("-- After set a new value")
str_foo = "%(name)s is %(baz)s!"
config.set('Section1', 'foo', str_foo)
str_foo = config.get('Section1', 'foo', 1)
print(str_foo)
str_foo = config.get('Section1', 'foo')
print(str_foo)

## raw=0，返回替换后的值，替换的变量是在同 section 下或者 default section 中查找
str_foo = config.get('Section1', 'name')
print(str_foo)

## 接口还有另外一个可选参数 vars,
## 设置后，查询配置 values 时，会优先从vars这个{}寻找匹配的key返回
## 没有再去寻找配置文件中的。
print("-- use default value if pass by vars={}")
a_float = config.get('Section1', 'a_float1', vars={'a_float1':'0.01'})
print("-- number : %f type is : %s"%(float(a_float) ,type(a_float)))