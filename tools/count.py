#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys
sys.path.append('/home/h_zhanghui/zjxl/tools')
import zutil

index = 0
def run():
	num = 0
	for line in sys.stdin:
		line = line.strip()
		seg = line.split(",")
		vcode = seg[4]
		length = len(seg)
		if vcode[9:10] == 'E' or vcode[9:10] == 'F':
			num += 1
	print 'Number: ' + str(num)

if __name__ == '__main__':
	run()
