#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys
import time
import math
import zutil 


def distance(s1,s2):
	len1 = len(s1)
	len2 = len(s2)

	if len1 == 0 or len2 == 0:
		return len1 if len1 > len2 else len2
	
	if s1[0] == s2[0]:
		return distance(s1[1:],s2[1:])
	else:
		len12 = distance(s1,s2[1:])
		len21 = distance(s1[1:],s2)
		len22 = distance(s1[1:],s2[1:])
		return min(len12,len21,len22) + 1


if __name__ == '__main__':
	if len(sys.argv) < 3:
		print 'Usage: #./str-distance.py string1 string2 '
	res = distance(sys.argv[1],sys.argv[2])
	print 'Distance: %d' % (res)
