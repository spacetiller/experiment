#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys

def run():
	color = 1 
	for line in sys.stdin:
		line = line.strip()
		seg = line.split(",")
		if len(seg)!=2:
			continue
		print '                {name: \'' + seg[0] + '\',value: ' + seg[1] + '},'

if __name__ == '__main__':
	run()
