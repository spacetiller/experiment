#!/usr/bin/env python
import sys
import time

for line in sys.stdin:
	line = line.strip()
	seg = line.split(",")
	lng = float(seg[4])/600000
	lat = float(seg[5])/600000
	print str(lng) + ','  + str(lat) + ',' + seg[6] + ';' 
