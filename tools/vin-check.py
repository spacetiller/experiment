#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys
import time
import math
sys.path.append('/home/h_zhanghui/zjxl/revision')
import zutil 

#
# Function to check if a vin code is right.
# Param: vin code string
# Return: 0 - right, 1 - wrong length, 2 - containing I/O/Q, 3 - index overflow, 4 - wrong check digit
#
#def checkVcode(vcode):
#	values = {'0':0,'1':1,'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,'A':1,'B':2,'C':3,'D':4,'E':5,'F':6,'G':7,'H':8,'J':1,'K':2,'L':3,'M':4,'N':5,'P':7,'R':9,'S':2,'T':3,'U':4,'V':5,'W':6,'X':7,'Y':8,'Z':9}
#	weights = {1:8,2:7,3:6,4:5,5:4,6:3,7:2,8:10,9:0,10:9,11:8,12:7,13:6,14:5,15:4,16:3,17:2}
#	vlen = len(vcode)
#	if vlen != 17:
#		return 1,cc
#	sum = 0
#	cc = ''
#	cc9 = vcode[8]
#	for i in range(17):
#		vchar = vcode[i].upper()
#		if vchar not in values:
#			return 2,cc
#		j = i+1
#		if j not in weights:
#			return 3,cc
#		sum = sum + values[vchar]*weights[j]
#	cc = str(sum % 11)
#	if cc == '10':
#		cc = 'X'
#	if cc == cc9:
#		return 0,cc
#	else:
#		return 4,cc


if __name__ == '__main__':
	errinfo = {1:'Length is not 17',2:'Wrong char, may containing I/O/Q',3:'Index overflow',4:'Wrong check digit',5:'Not start with L'}
	if len(sys.argv) == 1:
		print 'Please add your vin code to check.  eg. #./vin-check.py CODE '
		exit(1)
	res = zutil.checkVcode(sys.argv[1])
	if res == 0:
		print 'Your vin code %s is right.' % sys.argv[1]
	elif res == 4:
		print 'Your vin code %s is WRONG. ErrCode: %d - %s, correct digit: %s' % (sys.argv[1],res,errinfo[res],'-')
	else:
		print 'Your vin code %s is WRONG. ErrCode: %d - %s' % (sys.argv[1],res,errinfo[res])
