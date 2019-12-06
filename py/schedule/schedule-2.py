# !/usr/bin/python3
# -*- coding:utf8 -*-

import datetime
import schedule
import threading
import time
 
def job1():
    print("I'm working for job1")
    time.sleep(2)
    print("job1:", datetime.datetime.now())
 
def job2():
    print("I'm working for job2")
    time.sleep(2)
    print("job2:", datetime.datetime.now())
 
def job1_task():
    threading.Thread(target=job1).start()
 
def job2_task():
    threading.Thread(target=job2).start()
 
def run():
    schedule.every(10).seconds.do(job1_task)
    schedule.every(10).seconds.do(job2_task)
 
    while True:
        schedule.run_pending()
        time.sleep(1)
