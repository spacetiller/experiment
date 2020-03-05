#!/usr/bin/env python
# _*_ coding:utf-8 _*_
__author__ = 'juncheng'

import sys

# sys.path.insert(0, 'D:/program/python-腾讯课程/0-01-python其他模块学习/')

import yaml

f = open('yaml_example.yml')
content = yaml.safe_load(f)

print(type(content))
print('修改前: ', content)   # 可以看出整个Yaml配置文件是一个字典, 里面可以包含字典和列表
content['age'] = 17     # 根据Key修改对应的值
content['children'][1]['age'] = 1
print('修改后: ', content)