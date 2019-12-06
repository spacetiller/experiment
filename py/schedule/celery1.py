# !/usr/bin/python
# -*- coding:utf8 -*-
#/user/bin/env python3

from celery import Celery
broker = "redis://127.0.0.1:6379/5"
backend = "redis://127.0.0.1:6379/6"
app = Celery("celery1", broker=broker, backend=backend)
@app.task
def add(x, y):
    return x+y

# celery -A celery1 worker --loglevel=info
# https://mp.weixin.qq.com/s/ESNhpI32LBWMrDIzLvukqQ
