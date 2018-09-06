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
print city_prov_dict

data = xlrd.open_workbook('Auman-2016Q1.xlsx')
table = data.sheets()[0]
#print "rows:%d,cols:%d"  % (table.nrows,table.ncols)
#print table.cell(1,0).value

workbook = xlwt.Workbook(encoding = 'utf-8')
worksheet = workbook.add_sheet('result')

print 'New cell writing ...'
for i in range(0,3): #table.nrows):
	for j in range(0,table.ncols):
		vcell = table.cell(i,j).value
		if j == 8:
			print vcell
			if vcell in city_prov_dict:
				vcell = city_prov_dict[vcell]
				print vcell	
		worksheet.write(i, j, label = vcell)

workbook.save('Auman-2016Q1-prov.xls')
print 'New excel file OK.'
