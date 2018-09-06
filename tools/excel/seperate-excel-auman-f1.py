#!/usr/bin/env python
#-*- coding: utf-8 -*-
import sys
import time
import xlrd
import xlwt

drive_info_file = file("province_area_mapper.txt","r")
lines = drive_info_file.readlines()
city_prov_dict = {}
for line in lines:
    line = line.strip()
    seq = line.split(",")
    if len(seq) != 4:
        continue
    if seq[3] not in city_prov_dict:
        city_prov_dict[seq[3]] = seq[1]

data = xlrd.open_workbook('Auman-2016Q1.xlsx')
table = data.sheets()[0]
print "rows:%d,cols:%d"  % (table.nrows,table.ncols)
lastcity = ''
of = 1
title = table.row_values(0)
workbook = xlwt.Workbook(encoding = 'utf-8')
#worksheet = workbook.add_sheet('')
for i in range(1,table.nrows):
	print 'processing  row %d' % i
	city = table.cell(i,8).value
	if lastcity == '':
		#print '1'
		lastcity = city
		worksheet = workbook.add_sheet(city)
		for j in range(0,table.ncols):
			worksheet.write(0, j, label = title[j])
		for j in range(0,table.ncols):
			worksheet.write(of, j, label = table.cell(i,j).value)
	elif city == lastcity :
		#print '2'
		for j in range(0,table.ncols):
			worksheet.write(of, j, label = table.cell(i,j).value)
	else:
		#print '3'
		#workbook.save(lastcity+'.xls')
		#workbook = xlwt.Workbook(encoding = 'utf-8')
		worksheet = workbook.add_sheet(city)
		for j in range(0,table.ncols):
			worksheet.write(0, j, label = title[j])
		for j in range(0,table.ncols):
			worksheet.write(1, j, label = table.cell(i,j).value)
		lastcity = city
		of = 1
	of += 1
print 'last save'
workbook.save('1.xls')

#prov_info_file = file("auman-model-6","r")
#lines = prov_info_file.readlines()
#for line in sys.stdin:
#	line = line.strip()
#	seq = line.split(",")
#	model = seq[0].strip()
#	num42 = 0
#	for i in range(1,4): # 3 pages
#		if html.find("抱歉，未找到和") >= 0:
#			break
#		else:
#			for dm in dm42:
