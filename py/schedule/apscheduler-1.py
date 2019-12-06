# !/usr/bin/python3
# -*- coding:utf8 -*-

from apscheduler.schedulers.blocking import BlockingScheduler
def my_job():
    print 'hello world'

sched = BlockingScheduler()
sched.add_job(my_job, 'interval', seconds=5)
sched.start()
