# !/usr/bin/python
# -*- coding:utf8 -*-
#/user/bin/env python3
import delegator
import time
import subprocess
from multiprocessing import Process
import logging
import shlex

if __name__ == '__main__':

    logging.basicConfig(level=logging.DEBUG,
                format='%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s',
                datefmt='%a, %d %b %Y %H:%M:%S',
                filename='main.log',
                filemode='w')
    console = logging.StreamHandler()
    console.setLevel(logging.DEBUG)
    formatter = logging.Formatter('%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s')
    console.setFormatter(formatter)
    logging.getLogger('').addHandler(console)

    #shell命令执行
    ls = subprocess.run('ls -lht', stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True, universal_newlines=True, cwd = None, timeout = 5)
    logging.info(ls.args)
    logging.info(ls.returncode)
    logging.info(ls.stdout)
   
    #非shell命令执行
    try:
        ffprobe = subprocess.run(shlex.split('ffprobe -show_streams -i rtmp://rtmp-push.source.test/live/i3jMugm01'), stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, shell=False, universal_newlines=True, cwd = '/usr/local/bin', timeout = 3)
    except Exception as e:
        logging.exception(e)
    else:
        logging.info(ffprobe.args)
        logging.info(ffprobe.returncode)
        logging.info(ffprobe.stdout)
