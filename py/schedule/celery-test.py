# !/usr/bin/python
# -*- coding:utf8 -*-

import time
from celery1 import add
re = add.delay(10, 20)
print(re)
print(re.status)
time.sleep(8)
print(re.status)
print(re.result)
