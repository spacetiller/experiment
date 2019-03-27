#!/usr/bin/python

import sys 
import math

def getRad(d):
    return d * math.pi / 180.0
def distance(lng1,lat1,lng2,lat2):
    earth_radius = 6378137.0
    radLat1 = getRad(lat1)
    radLat2 = getRad(lat2)
    a = radLat1 - radLat2
    b = getRad(lng1) - getRad(lng2)
    s = 2 * math.asin(math.sqrt(math.pow(math.sin(a/2), 2)+math.cos(radLat1) * math.cos(radLat2) * math.pow(math.sin(b/2), 2)))
    s = s * earth_radius
    s = round(s * 10000) / 10000.0
    return s

if __name__ == '__main__':
	if len(sys.argv) < 5:
		print 'Please add two dot.  eg. #./vin-check.py x1 y1 x2 y2 '
		exit(1)
	x1 = float(sys.argv[1])
	y1 = float(sys.argv[2])
	x2 = float(sys.argv[3])
	y2 = float(sys.argv[4])
	res = distance(x1,y1,x2,y2)
	if res >= 0:
		print 'Distance between %.2f,%.2f - %.2f,%.2f: %.2f m' % (x1,y1,x2,y2,res)
	else:
		print 'Your location is not correct. '
