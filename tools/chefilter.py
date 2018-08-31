#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys
import time
import math

#
# Function to check if a vin code is right.
# Param: vin code string
# Return: 0 - right, 1 - wrong length, 2 - containing I/O/Q, 3 - index overflow, 4 - wrong check digit
#
def checkVcode(vcode):
	values = {'0':0,'1':1,'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,'A':1,'B':2,'C':3,'D':4,'E':5,'F':6,'G':7,'H':8,'J':1,'K':2,'L':3,'M':4,'N':5,'P':7,'R':9,'S':2,'T':3,'U':4,'V':5,'W':6,'X':7,'Y':8,'Z':9}
	weights = {1:8,2:7,3:6,4:5,5:4,6:3,7:2,8:10,9:0,10:9,11:8,12:7,13:6,14:5,15:4,16:3,17:2}
	vlen = len(vcode)
	if vlen != 17:
		return 1	
	sum = 0
	cc = ''
	cc9 = vcode[8]
	for i in range(17):
		vchar = vcode[i].upper()
		if vchar not in values:
			return 2
		j = i+1
		if j not in weights:
			return 3
		sum = sum + values[vchar]*weights[j]
	cc = str(sum % 11)
	if cc == '10':
		cc = 'X'
	if cc == cc9:
		return 0
	else:
		return 4

def run():
	color = 1
	model = ''
	for line in sys.stdin:
		line = line.strip()
		seg = line.split(",")
		if len(seg)==43:
			brd = seg[5]
			brd = brd.strip()
			#if seg[8] not in prov_info_dict :
			#	continue
			#if seq[2].find("黄色")>=0:
			#	color = 1
			#elif seq[2].find("蓝色")>=0:
			#	color = 2
			#elif seq[2].find("黑色")>=0:
			#	color = 3 
			#elif seq[2].find("白色")>=0:
			#	color = 4
			#elif seq[2].find("其他")>=0:
			#	color = 5
			#model = seg[6]
			#if model[0:9] == '欧曼牌':
			#	model = model[9:]
			#elif model[0:6] == '欧曼':
			#	model = model[6:]
			if checkVcode(seg[7]) != 0:	# wrong vin code
				print line + ',1'
		else:
			print line + ',2'

if __name__ == '__main__':
	run()
