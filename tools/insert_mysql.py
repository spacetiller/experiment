#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys
import datetime
import math
import os

#zutil_home = os.getenv('HOME')
#sys.path.append(zutil_home  + '/zjxl/tools')
#import zutil

import MySQLdb

TIME_TYPE_DAY = '1'
TIME_TYPE_WEEK = '2'
TIME_TYPE_MONTH = '3'
data_type_dict = {'hy_fp_vnum_day': '110101', 'hy_ol_vnum_day': '110202' }
data_dir='/data/data4/biwap'

try:
	conn=MySQLdb.connect(host='10.60.32.89',user='sjyy',passwd='aisSHSLhoJMexn6a',port=3306)
	cur=conn.cursor()
	conn.select_db('BI_Data')
	#count=cur.execute('select * from bi_hy')
	#print 'there has %s rows record' % count
	
	#count=cur.execute('CREATE DATABASE IF NOT EXISTS `BI_Test`')
	count=cur.execute('select * from bi_data_all')
	print 'there has %s rows record' % count
except MySQLdb.Error,e:
	count=cur.execute('''CREATE TABLE IF NOT EXISTS `bi_data_all` ( 
							`uuid` int(11) NOT NULL AUTO_INCREMENT , 
							`create_time`  date NOT NULL ,
							`time_type`  int(2) NULL DEFAULT NULL COMMENT "1:天,2:周,3:月" ,
							`data_type`  int(10) NULL DEFAULT NULL ,
							`data`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT "指标数据" ,
							`week_of_year`  int(100) NULL DEFAULT NULL COMMENT "年的多少周" ,
							PRIMARY KEY (`uuid`, `create_time`)
						) ENGINE=InnoDB
						DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
						AUTO_INCREMENT=8
						ROW_FORMAT=COMPACT''')
    #print "Mysql Error %d: %s" % (e.args[0], e.args[1])


def insert_one_with0(cur, date, time_type, data_type, value, week_of_year='0'):
	table = 'bi_data_all'
	if not cur :
		return 1
	try:
		vf = float(value)
	except:
		return 1
	else:
		vf = float(value)
	res = cur.execute('select * from ' + table + ' where create_time = ' + date + ' and time_type = ' + time_type + ' and data_type = ' + data_type)
	if res == 0:
		cur.execute('insert into ' + table + '(create_time, time_type, data_type, data, week_of_year) values(' + date + ', ' + time_type + ', ' + data_type + ',' + value + ',' + week_of_year + ' )')
	elif res >= 1:
		cur.execute('update ' + table + ' set data = "' + value + '" where create_time = ' + date + ' and time_type = ' + time_type + ' and data_type = ' + data_type + '')
	return 0
	
def insert_one(cur, date, time_type, data_type, value, week_of_year='0'):
	table = 'bi_data_all'
	if not cur :
		return 1
	try:
		vf = float(value)
	except:
		return 1
	else:
		vf = float(value)
	if vf == 0.0 :
		return 1
	res = cur.execute('select * from ' + table + ' where create_time = ' + date + ' and time_type = ' + time_type + ' and data_type = ' + data_type)
	if res == 0:
		cur.execute('insert into ' + table + '(create_time, time_type, data_type, data, week_of_year) values(' + date + ', ' + time_type + ', ' + data_type + ',' + value + ',' + week_of_year + ' )')
	elif res >= 1:
		cur.execute('update ' + table + ' set data = "' + value + '" where create_time = ' + date + ' and time_type = ' + time_type + ' and data_type = ' + data_type + '')
	return 0
	

now = datetime.datetime.now()
yesterday = now - datetime.timedelta(days=1)
yesterday = yesterday.strftime("%Y%m%d")

if len(sys.argv) > 1:
    date_ymd = sys.argv[1]
else:
	date_ymd = yesterday

if len(date_ymd) != 8 or date_ymd[:3] != '201':
	date_ymd = yesterday

try:
	file_hy = data_dir + '/out-hy-' + date_ymd
	data_file = file(file_hy,'r')
	lines = data_file.readlines()
	for line in lines:
		line = line.strip()
		print line
		seq = line.split(",")
		# insert: 0			1		2		3	 4		 5			6	  7		8	 9			10		11		12		13	 14	 	15 		16  17		18		19 	  20
		# insert: 20160613,3644675,3483840,9570,1708381,0.063049,0.435242,25,3455121,1947775,0.062179,0.410427,0.187231,0.0,3421420,2417064,0.0,0.0,0.468733,0.537971,0.0
		insert_one(cur,seq[0].strip(),TIME_TYPE_DAY,'110101',seq[2].strip(),seq[7].strip())	# 当日入网车辆数
		insert_one(cur,seq[0].strip(),TIME_TYPE_DAY,'110202',seq[4].strip(),seq[7].strip()) # 当日上线车辆数
		insert_one(cur,seq[0].strip(),TIME_TYPE_DAY,'110303',seq[18].strip(),seq[7].strip()) # 当日上线率
		insert_one(cur,seq[0].strip(),TIME_TYPE_DAY,'110404',seq[6].strip(),seq[7].strip()) # 当日时间在线率
		insert_one(cur,seq[0].strip(),TIME_TYPE_DAY,'110505',seq[5].strip(),seq[7].strip()) # 当日轨迹完整率
		insert_one(cur,seq[0].strip(),TIME_TYPE_DAY,'110606',seq[3].strip(),seq[7].strip()) # 当日新增入网车辆数
		insert_one(cur,seq[0].strip(),TIME_TYPE_DAY,'110707',seq[21].strip(),seq[7].strip()) # 当日车辆轨迹错误率
		insert_one(cur,seq[0].strip(),TIME_TYPE_WEEK,'210101',seq[8].strip(),seq[7].strip()) # 上周新增入网车辆数
		insert_one(cur,seq[0].strip(),TIME_TYPE_WEEK,'210202',seq[9].strip(),seq[7].strip()) # 上周上线车辆数
		insert_one(cur,seq[0].strip(),TIME_TYPE_WEEK,'210303',seq[19].strip(),seq[7].strip()) # 上周上线率
		insert_one(cur,seq[0].strip(),TIME_TYPE_WEEK,'210404',seq[11].strip(),seq[7].strip()) # 上周时间在线率
		insert_one(cur,seq[0].strip(),TIME_TYPE_WEEK,'210505',seq[10].strip(),seq[7].strip()) # 上周轨迹完整率
		insert_one(cur,seq[0].strip(),TIME_TYPE_WEEK,'210606',seq[12].strip(),seq[7].strip()) # 上周新增车架号正确率
		insert_one(cur,seq[0].strip(),TIME_TYPE_WEEK,'210707',seq[22].strip(),seq[7].strip()) # 上周车辆轨迹错误率

	file_lh = data_dir + '/out-xyy-' + date_ymd
	data_file = file(file_lh,'r')
	lines = data_file.readlines()
	for line in lines:
		line = line.strip()
		print line
		seq = line.split(",")
		# insert: 0			1		2  3	4	5
		# insert: 20160615,492949,1056,25,3145,31236
		insert_one(cur,seq[0].strip(),TIME_TYPE_DAY,'131011',seq[1].strip(),seq[3].strip())	# 截止当日车辆数
		insert_one(cur,seq[0].strip(),TIME_TYPE_WEEK,'231011',seq[4].strip(),seq[3].strip()) # 上周新增车辆数
		#insert_one(cur,seq[0].strip(),TIME_TYPE_MONTH,'',seq[5].strip(),seq[3].strip()) # 上月新增车辆数
		cur.execute('insert into bi_xyy(date_day,day_vehicle_num,day_vehicle_inc_num,week_of_year,week_vehicle_inc_num,month_vehicle_inc_num) values(' + line + ')')

	file_lh = data_dir + '/out-crm-' + date_ymd
	data_file = file(file_lh,'r')
	lines = data_file.readlines()
	for line in lines:
		line = line.strip()
		print line
		seq = line.split(",")
		# insert: 0			1		2   3	 4	  5
		# insert: 20160615,980938,3501,25,16291,120393
		insert_one(cur,seq[0].strip(),TIME_TYPE_DAY,'141112',seq[1].strip(),seq[3].strip())	# 截止当日用户数
		insert_one(cur,seq[0].strip(),TIME_TYPE_WEEK,'241112',seq[4].strip(),seq[3].strip()) # 上周新增用户数
		#insert_one(cur,seq[0].strip(),TIME_TYPE_WEEK,'220707',seq[12].strip(),seq[5].strip()) # 上月新增用户数
		cur.execute('insert into bi_custom(date_day,day_user_num,day_user_inc_num,week_of_year,week_user_inc_num,month_user_inc_num) values(' + line + ')')

	file_lh = data_dir + '/out-vims-' + date_ymd
	data_file = file(file_lh,'r')
	lines = data_file.readlines()
	for line in lines:
		line = line.strip()
		print line
		seq = line.split(",")
		# insert: 0			1		2   3	 4	  5
		# insert: 20160615,3831234,5444,25,23886,139234
		insert_one(cur,seq[0].strip(),TIME_TYPE_DAY,'151213',seq[1].strip(),seq[3].strip())	# 截止当日车辆数
		insert_one(cur,seq[0].strip(),TIME_TYPE_WEEK,'251213',seq[4].strip(),seq[3].strip()) # 上周新增车辆数
		#insert_one(cur,seq[0].strip(),TIME_TYPE_WEEK,'220707',seq[12].strip(),seq[5].strip()) # 上月新增车辆数
		cur.execute('insert into bi_vims(date_day,day_vehicle_num,day_vehicle_inc_num,week_of_year,week_vehicle_inc_num,month_vehicle_inc_num) values(' + line + ')')

	file_lh = data_dir + '/out-lh-' + date_ymd
	data_file = file(file_lh,'r')
	lines = data_file.readlines()
	for line in lines:
		line = line.strip()
		print line
		seq = line.split(",")
		# insert: 0			1		2    3	 		4		 	  5	6 7 8   9 10 11		12				 13   14	 
		# insert: 20160613,874942,3301,113231,0.4611801242236025,25,0,0,0.0,0,0,0.0,0.2177132701421801,185964,7604
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_DAY,'120606',seq[1].strip(),seq[5].strip())	# 当日注册用户数
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_DAY,'120607',seq[3].strip(),seq[5].strip())	# 当日活跃用户数
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_DAY,'120708',seq[2].strip(),seq[5].strip())	# 当日新增注册用户数
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_DAY,'120809',seq[4].strip(),seq[5].strip())	# 当日次日留存率
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_DAY,'120910',seq[12].strip(),seq[5].strip())	# 当日7日留存率
		#insert_one_with0(cur,seq[0].strip(),TIME_TYPE_WEEK,'220707',seq[].strip(),seq[7].strip()) # 上周注册用户数
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_WEEK,'220708',seq[7].strip(),seq[5].strip()) # 上周活跃用户数
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_WEEK,'220809',seq[6].strip(),seq[5].strip()) # 上周新增注册用户数
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_WEEK,'220910',seq[8].strip(),seq[5].strip()) # 上周7日留存率
		#insert_one_with0(cur,seq[0].strip(),TIME_TYPE_MONTH,'320101',seq[9].strip(),seq[5].strip()) # 上月注册用户数
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_MONTH,'320102',seq[10].strip(),seq[5].strip()) # 上月活跃用户数
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_MONTH,'320203',seq[11].strip(),seq[5].strip()) # 上月留存率
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_MONTH,'320304',seq[9].strip(),seq[5].strip()) # 上月新增注册用户数
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_MONTH,'320305',seq[13].strip(),seq[5].strip()) # 上月活跃用户数
		insert_one_with0(cur,seq[0].strip(),TIME_TYPE_MONTH,'320306',seq[14].strip(),seq[5].strip()) # 回归的流失用户数



except MySQLdb.Error,e:
	print "Mysql Error %d: %s" % (e.args[0], e.args[1])

try:
	conn.commit()
	conn.close()
except:
	print "Mysql commit error. "


if __name__ == '__main__':
	pass	
