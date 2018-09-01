#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys

def fillput(num):
	ns = str(num)
	ln = len(ns)
	if ln >= maxlen:
		return ns
	else:
		return '0'*(maxlen-ln) + ns

def output(mi,ma,st,cur):
	ret = ''
	if cur < ma:
		ret = ret + 'IF(' + orig + '2<' + str(cur) + ',"' + to + '~' + fillput(cur) + '",'
		ret = ret + output(mi,ma,st,cur+st)
		ret = ret + ')'
	else:
		ret = '"' + to + fillput(cur-st) + '~"'
	return ret

if len(sys.argv) != 6:
	print "Usage: ./this I I 0 100 5"
	exit(1)
orig = sys.argv[1]
to = sys.argv[2]
min = int(sys.argv[3])
max = int(sys.argv[4])
step = int(sys.argv[5])
cursor = 0
maxlen = len(sys.argv[4])

print output(min,max,step,step)
