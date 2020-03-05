#!/usr/bin/env python
# _*_ coding:utf-8 _*_

#from six.moves.configparser import ConfigParser
from configparser import ConfigParser

cp = ConfigParser()
cp.read("./default.cfg")

name = cp.get("DEFAULT", "default_name")
print(name)