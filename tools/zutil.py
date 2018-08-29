#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys
import re
import datetime
import time
import math
import inspect
#import traceback

# int = checkVcode(vcode) # 0,1,2,3,4
# vcode = reviseVcode(vin_code):
# int = vin2year(char)
# int = modelClean(amodel) # 0,1,2,3,4
# model = modelCheck(model)
# model = modelCheckWithVin(model,vcode)
# type,total = getTypeWeightFromModel(model,totalf,totalw,vcode)
# type,total = getTypeWeight(model,totalf,totalw,vcode,vtype)
# type = getTypeFromModel(model)
# model = _revise_model_bj(mdl, vtype='')
# ...
# model = modelRevise(model, vtype='',brand='',vcode='',vmodel = -1, vvin = -1)
# drive = _get_drive_from_model_bj(model,special_code_dict = {})
# ...
# drive = _get_drive_from_model_zz(model,special_code_dict = {})
# drive = _get_drive_from_vin_ca(vcode)
# ...
# drive = _get_drive_from_vin_zz(vcode)
# drive = getDrive(model,vcode = '',axis = 0, tires = 0)
# brand = getBrand(model,vcode = '',vmodel = -1, vvin = -1)
# brand = getBrand2(model,vcode = '',vmodel = -1, vvin = -1)
# ftype = getFuelType(model, emodel = '', vcode = '', vmodel = -1, vvin = -1)
# etype = get_emission_type(model, emodel = '', vcode = '', vmodel = -1, vvin = -1)
# first = getFirstFromVlineString(vline)
# aff = get_affiliate(owner,cnum,cratio)

#drive_info_file = file("vehicle-drive-mode.dic","r")
#lines = drive_info_file.readlines()
#drive_dict = {}
#for line in lines:
#	line = line.strip()
#	seq = line.split(",")
#	if len(seq) != 3:
#		continue
#	if seq[0] not in drive_dict:
#		drive_dict[seq[0]] = seq[2]
##print "drive dict len: %d" % len(drive_dict)
#
#special_code_file = file("vehicle-special-code.dic","r")
#lines = special_code_file.readlines()
#special_code_dict = {}
#for line in lines:
#	line = line.strip()
#	seq = line.split(",")
#	if len(seq) != 2:
#		continue
#	if seq[0] not in special_code_dict:
#		special_code_dict[seq[0]] = seq[1]

# DEBUG layer: 1 - Critical, 2 - Urgent, 3 - Important, 4 - Debug , 5 - Info, 6 - Env, 7 - Trivial, above - no debug
# Only 0, 4 and 10 Used Here !!!
_Z_DEBUG_LEVEL = 0
_Z_DEBUG_CRTITICAL = 1
_Z_DEBUG_URGENT = 2
_Z_DEBUG_IMPORTANT = 3
_Z_DEBUG_DEBUG = 4
def _function_enter(debug = 100):
	if debug <= _Z_DEBUG_LEVEL:
		fname = sys._getframe().f_code.co_filename
		#fcname = sys._getframe().f_code.co_name
		fcname = inspect.stack()[1][3]
		#print str(time.time()) + ' Enter function : ------ ' + fname + '->' + fcname + '-----'
		print '%.6f Enter function : ------ %s->%s-----' % (time.time(), fname, fcname)
	return
def _function_exit(debug = 100):
	if debug <= _Z_DEBUG_LEVEL:
		fname = sys._getframe().f_code.co_filename
		#fcname = sys._getframe().f_code.co_name
		fcname = inspect.stack()[1][3]
		#print str(time.time()) + ' Exit function : ------ ' + fcname + '-----'
		print '%.6f Exit function : ------ %s -----' % (time.time(), fcname)
	return
def _debug(msg,debug = _Z_DEBUG_DEBUG):
	if debug <= _Z_DEBUG_LEVEL:
		print msg
	return
#
# Function to check if a vin code is right.
# Param: vin code string
# Return: 0 - right, 1 - wrong length, 2 - containing I/O/Q or other incorrect char(like chinese char), 3 - empty vcode or '其他', 4 - wrong check digit 5 - other error
#
def checkVcode(vcode):
	_function_enter(_Z_DEBUG_DEBUG)
	vcode = vcode.upper()
	_debug('check vincode: ' + vcode,_Z_DEBUG_DEBUG)
	values = {'0':0,'1':1,'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,'A':1,'B':2,'C':3,'D':4,'E':5,'F':6,'G':7,'H':8,'J':1,'K':2,'L':3,'M':4,'N':5,'P':7,'R':9,'S':2,'T':3,'U':4,'V':5,'W':6,'X':7,'Y':8,'Z':9}
	weights = {1:8,2:7,3:6,4:5,5:4,6:3,7:2,8:10,9:0,10:9,11:8,12:7,13:6,14:5,15:4,16:3,17:2}
	vlen = len(vcode)
	if vlen == 0 :
		_debug('result: len=0  3',_Z_DEBUG_DEBUG)
		_function_exit(_Z_DEBUG_DEBUG)
		return 3
	if vcode == '其他': # move to 3 from 2, @zhanghui, 20160907
		_debug('result: qita  3',_Z_DEBUG_DEBUG)
		_function_exit(_Z_DEBUG_DEBUG)
		return 3 
	if vlen == 8 or vlen == 5: # to do
		_debug('result: len=5/8  0',_Z_DEBUG_DEBUG)
		_function_exit(_Z_DEBUG_DEBUG)
		return 0
	if vlen != 17 and vlen != 5 and vlen != 8:
		_debug('result: len=' + str(vlen) + ' 1',_Z_DEBUG_DEBUG)
		_function_exit(_Z_DEBUG_DEBUG)
		return 1
	sum = 0
	cc = ''
	cc9 = vcode[8]
	for i in range(17):
		vchar = vcode[i] #.upper()
		if vchar not in values:
			_function_exit(_Z_DEBUG_DEBUG)
			return 2
		j = i+1
		if j not in weights:
			return 31
		sum = sum + values[vchar]*weights[j]
	cc = str(sum % 11)
	_debug('calculated cc: ' + cc,_Z_DEBUG_DEBUG)
	if cc == '10':
		cc = 'X'
	if cc == cc9:
		#if vcode[0:1] != 'L' and vcode[0:1] != 'W' and vcode[0:1] != 'J':
		#	return 5
		_debug('result: rule check ok!',_Z_DEBUG_DEBUG)
		_function_exit(_Z_DEBUG_DEBUG)
		return 0
	else:
		_debug('result: rule check wrong  4',_Z_DEBUG_DEBUG)
		_function_exit(_Z_DEBUG_DEBUG)
		return 4

def checkVcode17(vcode):
	if checkVcode(vcode) == 0 and len(vcode)== 17:
		return 0
	else:
		return 1

#
# Function: revise vin code
# Param: vin code
# Return: vin code, rd(revised flag: 0: no change, 1: revised correctly, 2: error)
#
def reviseVcode(vin_code, max_valid_vin, valid_vincode = -1, loop_layer = 0):
	_function_enter(_Z_DEBUG_DEBUG)
	vcode = vin_code.strip().upper()
	vcode_out = vcode
	vl = len(vcode)
	rd = valid_vincode
	rdd = 0 # next level rd flag, not usful
	valid_vin = valid_vincode
	layer = loop_layer

	if max_valid_vin == '':
		return vcode,rd
	
	# todo, only 1 layer now.
	_debug('layer: ' + str(layer),_Z_DEBUG_DEBUG)
	if layer > 10:
		_function_exit(_Z_DEBUG_DEBUG)
		return vcode_out,rd
	
	if valid_vin == -1:
		valid_vin = checkVcode(vcode)
	
	orig_char = ['6','C','G','G','B','8','0','8','0','B','E','S','5','Z','2','D','0','K','N'] # wrong char
	mod_char  = ['0','G','C','6','8','B','8','0','B','0','B','5','S','2','Z','0','D','M','M'] # right char 
	ioq_char = ['I','O','Q']
	rev_char  = ['1','0','0']
	
	# 1 use cc-model-vin to find 1st part of vcode
	if valid_vin == 0:
		#return vcode
		pass
	elif vl == 18:
		_debug('vl == 18: ' ,_Z_DEBUG_DEBUG)
		for i in range(0,vl):
			#vcode_181 = vcode.replace(vcode[i],'')
			vcode_181 = vcode[:i] + vcode[i+1:]
			_debug('candidate vcode:  ' + vcode_181 ,_Z_DEBUG_DEBUG)
			res181 = checkVcode(vcode_181) # delete 1 char
			if res181 == 0 and vcode_181[:8] in max_valid_vin:
				_debug('candidate ok, return! ' ,_Z_DEBUG_DEBUG)
				vcode_out = vcode_181
				rd = 1
				return vcode_out,rd
			#else:
			#	_debug('candidate ok, return! ' ,_Z_DEBUG_DEBUG)
			#	vcode_181_r,rdd = reviseVcode(vcode_181,res181)
			#	if checkVcode(vcode_181_r) == 0:
			#		vcode_out = vcode_181_r
			#		rd = 1
	elif vl != 17:
		pass
	elif valid_vin == 4:
		_debug('valid_vin = 4:  ' ,_Z_DEBUG_DEBUG)
		cl = len(orig_char)
		for i in range(0,cl):
			co = orig_char[i]
			cm = mod_char[i]
			cidx = vcode.find(co)
		#	print 'co: ' + co
			if cidx >= 0:
				j = cidx
				while j >= 0:
					vcodeC = vcode[:j] + cm + vcode[j+1:]
					_debug('candidate vcode:  ' + vcodeC ,_Z_DEBUG_DEBUG)
					#print 'j: ' + str(j) + ' ' + vcodeC
					res401 =  checkVcode(vcodeC)
					if res401 == 0 and vcodeC[:8] in max_valid_vin:
						_debug('candidate ok, return! ' ,_Z_DEBUG_DEBUG)
						vcode_out = vcodeC
						rd = 1
						_function_exit(_Z_DEBUG_DEBUG)
						return vcode_out,rd
					j = vcode.find(co,j+1,-1)

	elif valid_vin == 3 or valid_vin == 1:
		#return vcode
		_debug('valid_vin = 1/3:  ' ,_Z_DEBUG_DEBUG)
		pass
	elif valid_vin == 2:
		_debug('valid_vin = 2:  ' ,_Z_DEBUG_DEBUG)
		if vcode == '其他':
			pass
		for i in range(0,3):
			if vcode.find(ioq_char[i]) >= 0:
				vcodeQ = vcode.replace(ioq_char[i],rev_char[i])
				_debug('candidate vcode:  ' + vcodeQ ,_Z_DEBUG_DEBUG)
				resQ = checkVcode(vcodeQ)
				if resQ == 0 and vcodeQ[:8] in max_valid_vin:
					_debug('candidate ok, return! ' ,_Z_DEBUG_DEBUG)
					vcode_out = vcodeQ
					rd = 1
					_function_exit(_Z_DEBUG_DEBUG)
					return vcode_out,rd
				#else:
				#	vcodeQ_r,rdd = reviseVcode(vcodeQ,resQ)
				#	vcode_out = vcodeQ_r
				#	rd = rdd
					#if checkVcode(vcodeQ_r) == 0:
					#	vcode_out = vcodeQ_r
					#	rd = 1
	_function_exit(_Z_DEBUG_DEBUG)
	return vcode_out,rd

def vin2year(char):
	if len(char) != 1:
		return '1112'
	vasc = ord(char.upper())
	thisyear = int(datetime.datetime.now().strftime("%Y"))
	if vasc in range(49,58):	# 1-9 
	#   vyr = '200' + str(char)
		vyr = 2031 + (vasc - 49) 
		if vyr  > thisyear:
			vyr = vyr - 30
		vyear = str(vyr)
	elif vasc in range(65,73): # A-H
		vyr = 2010 + (vasc - 65) 
		if vyr  > thisyear:
			vyr = vyr - 30
		vyear = str(vyr)
	elif vasc in range(74,79): # J-N
		vyr = 2018 + (vasc - 74) 
		if vyr  > thisyear:
			vyr = vyr - 30
		vyear = str(vyr)
	elif vasc == 80: # P 
		vyr = 2023
		if vyr  > thisyear:
			vyr = vyr - 30
		vyear = str(vyr)
	elif vasc in range(82,85): # R-T
		vyr = 2024 + (vasc - 82)
		if vyr  > thisyear:
			vyr = vyr - 30
		vyear = str(vyr)
	elif vasc in range(86,90): # V-Y
		vyr = 2027 + (vasc - 86)
		if vyr  > thisyear:
			vyr = vyr - 30
		vyear = str(vyr)
	else:
	#   print "Wrong char found: " + char
		vyear = '1111'
	return vyear

# deprecated
def modelCheckLoose(model):
	mdl = model.upper()
	if len(mdl) ==  0:  
		return 3
	if mdl == '其他' or len(mdl) < 7 : 
		return 3
	if re.match('[\u4e00-\u9fa5]+',mdl) == None:
		return 1
	while re.match('[\u4e00-\u9fa5]+',mdl) == None:
		mdl = mdl[3:]
	#	if mdl == '':
	#		mdl = '-'
	#		break
	if len(mdl) < 5 and mdl.isdigit():
		return 3
	m = mdl[1:2]
	if m.isdigit() and re.match('[0-9]'+m+m+'+',mdl) != None:
		return 3
	if re.match('[A-Z]{2}[A-Z]?[1345][0-9]{3}[A-Z]+',mdl) == None:
		return 4
	else:
		return 0 

# Function to clean a vehicle model, remove Hanzi and some incorrect chars
def modelClean(amodel):
	mdl = amodel.upper()
	if len(mdl) == 0:
		return '-' #mdl
	while re.match('[\u4e00-\u9fa5]+',mdl) == None:
		mdl = mdl[3:]
		if mdl == '':
			mdl = '-'
			break
	mdl = mdl.replace('—','-')
	mdl = mdl.replace('－','-')
	mdl = mdl.replace('__','-')
	mdl = mdl.replace('_','-')
	if len(mdl) == 0:
		return '-' #mdl
	return mdl

#
# Function to check if a model is right
# Param: model string
# Return: 0 - right, 1 - containing Hanzi except '其他', 2 - containing other incorrect char, 
#		  3 - empty, or '其他', or less than 5 digits, or after removing Hanzi, left %11111% or %10000%
#		  4 - wrong format
#
def modelCheck(model,model_is_std=-1): 
	_function_enter(_Z_DEBUG_DEBUG)
	_debug('Model to Check: ' + str(model), _Z_DEBUG_DEBUG)
	mdl = model.upper()
	if model_is_std == 1:
		_function_exit(_Z_DEBUG_DEBUG)
		return 0
	if len(mdl) ==  0:  
		_function_exit(_Z_DEBUG_DEBUG)
		return 3
	if mdl == '其他' or (len(mdl) < 5  and mdl.isdigit()):
		_function_exit(_Z_DEBUG_DEBUG)
		return 3
	if mdl.find('_') >= 0 or mdl.find('—') >= 0:
		_function_exit(_Z_DEBUG_DEBUG)
		return 2
	if re.match('[\u4e00-\u9fa5]+',mdl) == None:
		_function_exit(_Z_DEBUG_DEBUG)
		return 1
	mdl = modelClean(mdl)
	if len(mdl) < 5 and mdl.isdigit():
		_function_exit(_Z_DEBUG_DEBUG)
		return 3
	m = mdl[1:2]
	if m.isdigit() and re.match('[0-9]'+m+m+'+',mdl) != None:
		_function_exit(_Z_DEBUG_DEBUG)
		return 3
	if re.match('[A-Z]{2}[A-Z]?[1-79][0-9]{3}[A-Z0-9]+',mdl) == None: # 1345 -> 1-7/9
		_function_exit(_Z_DEBUG_DEBUG)
		return 4
	else:
		_function_exit(_Z_DEBUG_DEBUG)
		return 0

#
# Function to check if a model is right
# Param: model string
# Return: 0 - right, 1 - containing Hanzi except '其他', 2 - containing other incorrect char, 
#		  3 - empty, or '其他', or less than 5 digits, or after removing Hanzi, left %11111% or %10000%
#		  4 - wrong format
#
def modelCheckWithVin(model,vcode='',model_is_std=-1):
	_function_enter(_Z_DEBUG_DEBUG)
	_debug('Model to Check: ' + str(model), _Z_DEBUG_DEBUG)
	mdl = model.upper()
	#if model_is_std == 1:   # check std at last
	#	_function_exit(_Z_DEBUG_DEBUG)
	#	return 0
	if len(mdl) ==  0:  
		_function_exit(_Z_DEBUG_DEBUG)
		return 3
	if mdl == '其他' : #or (len(mdl) < 5  and mdl.isdigit()):
		_function_exit(_Z_DEBUG_DEBUG)
		return 3
	if mdl.find('_') >= 0 or mdl.find('—') >= 0:
		_function_exit(_Z_DEBUG_DEBUG)
		return 2
	if re.match('[\u4e00-\u9fa5]+',mdl) == None:
		_function_exit(_Z_DEBUG_DEBUG)
		return 1
	mdl = modelClean(mdl)
	m = mdl[1:2]
	if m.isdigit() and re.match('[0-9]'+m+m+'+',mdl) != None:
		_function_exit(_Z_DEBUG_DEBUG)
		return 3
	if vcode != '' and vcode[0] != 'L' :
		if checkVcode(vcode) == 0 and ( mdl[0:2] in ['7Y','40','WD','9B','3C','YS','1F','1H','1N','1X','2L','1M','75'] or re.match('[0-9]{3}CC',mdl) != None ) :
			_function_exit(_Z_DEBUG_DEBUG)
			return 0
		#else:
		#	return 4
	else:
		if re.match('[A-Z]{2}[A-Z]?[1-79][0-9]{3}[0-9A-Z]+',mdl) == None: # 1345 -> 1-9
			_function_exit(_Z_DEBUG_DEBUG)
			return 4
		else:
			if model_is_std == 0:
				_function_exit(_Z_DEBUG_DEBUG)
				return 4
			else:
				_function_exit(_Z_DEBUG_DEBUG)
				return 0
	if model_is_std == 0:
		_function_exit(_Z_DEBUG_DEBUG)
		return 4
	else:
		_function_exit(_Z_DEBUG_DEBUG)
		return 0

# revise length
def reviseLength(length,model='',vcode=''):
	try:
		total = int(length)
	except:
		total = '0'
	v = 'L'
	if vcode != '':
		v = vcode[0:1].upper()
	if v != 'L':
		return total
	if total > 24000 or total < 3000:
		total = '0' 
	return str(total)

# revise height
def reviseHeight(height,model='',vcode=''):
	try:
		total = int(height)
	except:
		total = '0'
	v = 'L'
	if vcode != '':
		v = vcode[0:1].upper()
	if v != 'L':
		return total
	if total > 20000 and total < 50000:
		total = total / 10
	elif total > 5000 or total < 2000:
		total = '0'
	return str(total)

# revise width
def reviseWidth(width,model='',vcode=''):
	try:
		total = int(width)
	except:
		total = '0'
	v = 'L'
	if vcode != '':
		v = vcode[0:1].upper()
	if v != 'L':
		return total
	if total > 3000 or total < 2000:
		total = '0'
	return str(total)

# revise total weight/force
def _revise_total_weight(t,model='',vcode=''):
	try:
		total = int(t)
	except:
		total = '0'
	v = 'L'
	if vcode != '':
		v = vcode[0:1].upper()
	if v != 'L':
		return total
	if total > 500000 or total < 1000:
		total = '0' 
	elif total > 50000:
		total = total / 10
	return int(total)

# revise weight value, like total, load
def reviseWeight(t,model='',vcode=''):
	return _revise_total_weight(t,model,vcode)

# get model trunk, i.e. the first 2/3 chars
def getModelShortCN(model):
	short = ''
	if re.match('[A-Z]{2}[0-9]{4}[A-Z0-9]*',model) != None:
		short = model[:2]
	elif  re.match('[A-Z]{3}[0-9]{4}[A-Z0-9]*',model) != None:
		short = model[:3]
	return short

# return type,total, deprecateed
def getTypeWeightFromModel(model,totalf,totalw,vcode=''):
	if 1: #modelCheck(model) == 0:
		#print 'right model: %s' % model
		if re.match('[A-Z][A-Z][0-9][0-9][0-9][0-9]+',model) != None:
			t = model[2:3]
			total = model[3:5]
		elif  re.match('[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9]+',model) != None:
			t = model[3:4]
			total = model[4:6]
		else:
			t = '-1'
			try:
				totalw = float(totalw)
			except:
				try:
					totalf = float(totalf)
				except:
					total = '0.0'
				else:
					total = totalf 
			else:
				total = totalw
			return t,total
		t = int(t)
		total = float(total)
		total *= 1000
		total = _revise_total_weight(total,model,vcode)
		#print 'type: %d, total: %f' %(t,total)
		if t == 4:
			#print 'is 4 %f,%s,%s' %(total,totalf,totalw)
			try:
				totalf = float(totalf)
			except:
				total = float(total)
			else:
				totalf = _revise_total_weight(totalf,model,vcode)
				total = max(totalf,total)
		elif t > 0:
			total = total
			#print 'is not 4'
			#try:
			#	totalw = float(totalw)
			#except:
			#	total = float(total)
			#else:
			#	total = max(totalw,total)
		return t,total

# get type No. from type string
def _get_type_no_from_string(vtype):
	t = 0
	if (vtype.find('仓栅式') >= 0 or vtype.find('厢式') >= 0 or vtype.find('罐式') >= 0 or vtype.find('罐车') >= 0 or vtype.find('特殊结构') >= 0  or vtype.find('专项作业') >= 0  or vtype.find('混凝土') >= 0  or vtype.find('专用') >= 0  or vtype.find('粉粒物料') >= 0  or vtype.find('洒布') >= 0  or vtype.find('爆破器材') >= 0) and vtype.find('非') < 0:
		t = 5
	elif vtype.find('半挂车') >= 0 or  vtype.find('牵引车') >= 0 or  vtype.find('集装箱') >= 0 :
		t = 4
	elif vtype.find('自卸车') >= 0 or vtype.find('自卸货车') >= 0:
		t = 3
	elif vtype.find('重型普通货车') >= 0 :
		t = 1
	return t

# check type No. from type string
def _check_type_no_from_string(tno,vtype):
	t = int(tno) if tno.isdigit() else 0
	if t != 5 and ((vtype.find('仓栅式') >= 0 or vtype.find('厢式') >= 0 or vtype.find('罐式') >= 0 or vtype.find('罐车') >= 0 or vtype.find('特殊结构') >= 0  or vtype.find('专项作业') >= 0  or vtype.find('混凝土') >= 0  or vtype.find('专用') >= 0  or vtype.find('粉粒物料') >= 0  or vtype.find('洒布') >= 0  or vtype.find('爆破器材') >= 0) and vtype.find('非') < 0):
		t = 5
	elif t != 4 and (vtype.find('半挂车') >= 0 or  vtype.find('牵引车') >= 0 or  vtype.find('集装箱') >= 0) :
		t = 4
	elif t != 3 and (vtype.find('自卸车') >= 0 or vtype.find('自卸货车') >= 0):
		t = 3
	return t

# return type,total, deprecateed
def getTypeWeight(model,totalf,totalw,vcode='',vtype=''):
	_function_enter(_Z_DEBUG_DEBUG)
	if 1: #modelCheck(model) == 0:
		#print 'right model: %s' % model
		if re.match('[A-Z]{2}[0-9]{4}[A-Z0-9]+',model) != None:
			t = model[2:3]
			total = int(model[3:5])
		elif  re.match('[A-Z]{3}[0-9]{4}[A-Z0-9]+',model) != None:
			t = model[3:4]
			total = int(model[4:6])
		else:
			t = -1
			try:
				totalw = int(totalw)
			except:
				try:
					totalf = int(totalf)
				except:
					total = 0
				else:
					total = totalf 
			else:
				total = totalw
		t = int(t)
		total = int(total)
		if t != -1:
			total *= 1000
		total = _revise_total_weight(total,model,vcode)
		#print 'type: %d, total: %f' %(t,total)
		if t not in [1,3,4,5,9] and vtype != '':
			_debug("Type: %d, find from vtype: %s" % (t,vtype),_Z_DEBUG_DEBUG)
			t = _get_type_no_from_string(vtype)
		#t = _check_type_no_from_string(t,vtype)
		if t == 4:
			#print 'is 4 %f,%s,%s' %(total,totalf,totalw)
			try:
				totalf = int(totalf)
			except:
				total = int(total)
			else:
				totalf = _revise_total_weight(totalf,model,vcode)
				total = max(totalf,total)
		elif t > 0:
			#total = total
			#print 'is not 4'
			try:
				totalw = float(totalw)
			except:
				total = float(total)
			else:
				totalw = _revise_total_weight(totalw,model,vcode)
				total = max(totalw,total)
	_function_exit(_Z_DEBUG_DEBUG)
	return t,total

# return type: -1: error, 1~9, deprecated
def getTypeFromModel(model):
	if model != '' and modelCheck(model) == 0:
		#print 'right model: %s' % model
		if re.match('[A-Z]{2}[0-9]{4}[A-Z0-9]+',model) != None:
			t = model[2:3]
		elif  re.match('[A-Z]{3}[0-9]{4}[A-Z0-9]+',model) != None:
			t = model[3:4]
		else:
			t = '-1'
		t = int(t)
		#print 'type: %d, total: %f' %(t,total)
		return t
	else:
		return -1

def vague_C2N(char):
	if char == 'D':
		n = '0' 
	elif char == 'O':
		n = '0' 
	elif char == 'Q':
		n = '0' 
	elif char == 'J':
		n = '1' 
	elif char == 'L':
		n = '1' 
	elif char == 'I':
		n = '1' 
	elif char == 'F':
		n = '1' 
	elif char == 'Z':
		n = '2' 
	elif char == 'A': # ? 
		n = '2'
	elif char == 'S':
		n = '5'
	elif char == 'G':
		n = '6'
	elif char == 'B':
		n = '8'
	elif char == 'P':
		n = '9'
	else:
		n =  char
	return n

def vague_N2C(num):
	if num == '0':
		c = 'D'
	elif num == '1':
		c = 'J'
	elif num == '2':
		c = 'Z'
	elif num == '5':
		c = 'S'
	elif num == '7':
		c = 'T'
	elif num == '8':
		c = 'B'
	elif num == '9':
		c = 'P'
	else:
		c = num
	return c

#
#	revise an upper string,
#	Result: revised string
def _revise_string_upper(string, start, end, mode = ''):
	_function_enter(_Z_DEBUG_DEBUG)
	model = string.upper()
	if not str(start).isdigit() or not str(end).isdigit() or start > end:
		_debug('start or end not number, or start > end ' + str(model), _Z_DEBUG_DEBUG)
		_function_exit(_Z_DEBUG_DEBUG)
		return model
	subm = '' #model[2:6]
	for i in range(start,end):
		if mode == 'c2n':
			subm += vague_C2N(model[i])
		elif mode == 'n2c' :
			subm += vague_C2N(model[i])
		else:
			break
	if len(subm) == (end - start) :
		model = model[:start] + subm + model[end:]
	_function_exit(_Z_DEBUG_DEBUG)
	return model

def _revise_model_general(mdl,vtype='',brand='',vcode='',vvin = -1,special_code_dict = {}):
	_function_enter(_Z_DEBUG_DEBUG)
	model = mdl.upper()
	ml = len(model)
	if ml < 7:
		return model
	#if re.match('CACA[1345]\d{3}[A-Z0-9]*',model):
	#	model = model.replace('CACA','CA')
	
	if True:
		if re.match('[A-Z]{2}\w{4}[A-Z]+',model) != None and re.match('[A-Z]{2}\d{4}[A-Z]+',model) == None: 
			model = _revise_string_upper(model,2,6,'c2n')
			_debug('\tmodel refreshed2: ' + str(model), _Z_DEBUG_DEBUG)
		elif re.match('[A-Z]{3}\w{4}[A-Z]+',model) != None and re.match('[A-Z]{3}\d{4}[A-Z]+',model) == None: 
			model = _revise_string_upper(model,3,7,'c2n')
			_debug('\tmodel refreshed3: ' + str(model), _Z_DEBUG_DEBUG)

	_function_exit(_Z_DEBUG_DEBUG)
	return mdl

def _revise_model_ca(mdl,vtype='',brand='',vcode='',vvin = -1,special_code_dict = {}):
	_function_enter(_Z_DEBUG_DEBUG)
	model = mdl.upper()
	ml = len(model)
	if ml < 7:
		return model
	if re.match('CACA[1345]\d{3}[A-Z0-9]*',model):
		model = model.replace('CACA','CA')
		_debug('\tmodel refreshed1: ' + str(model), _Z_DEBUG_DEBUG)
	elif re.match('C[1345]\d{3}[A-Z0-9]*',model):
		model = 'CA' + model[1:]
		_debug('\tmodel refreshed2: ' + str(model), _Z_DEBUG_DEBUG)
	model = _revise_model_general(model,vtype,brand,vcode,vvin,special_code_dict) 
	_function_exit(_Z_DEBUG_DEBUG)
	return model

def _revise_model_df(mdl,vtype='',brand='',vcode='',vvin = -1,special_code_dict = {}):
	_function_enter(_Z_DEBUG_DEBUG)
	model = mdl.upper()
	ml = len(model)
	if ml < 7:
		return model
	if re.match('^E0[1345]\d{3}\w+',model) or re.match('EO[1345]\d{3}\w+',model):
		model = 'EQ' + model[2:]
		_debug('\tmodel refreshed1: ' + str(model), _Z_DEBUG_DEBUG)
	elif re.match('^Q[1345]\d{3}\w+',model) :
		model = 'E' + model
		_debug('\tmodel refreshed2: ' + str(model), _Z_DEBUG_DEBUG)
	elif re.match('^DF1[1345]\d{3}\w+',model) :
		model = 'DFL' + model[3:]
		_debug('\tmodel refreshed3: ' + str(model), _Z_DEBUG_DEBUG)
	model = _revise_model_general(model,vtype,brand,vcode,vvin,special_code_dict) 
	_function_exit(_Z_DEBUG_DEBUG)
	return mdl

def _revise_model_sx(mdl,vtype='',brand='',vcode='',vvin = -1,special_code_dict = {}):
	_function_enter(_Z_DEBUG_DEBUG)
	model = mdl.upper()
	ml = len(model)
	if ml < 7:
		return model
	if re.match('^5X[1345]\d{3}\w+',model):
		model = 'SX' + model[2:]
	model = _revise_model_general(model,vtype,brand,vcode,vvin,special_code_dict) 
	_function_exit(_Z_DEBUG_DEBUG)
	return mdl

def _revise_model_zz(mdl,vtype='',brand='',vcode='',vvin = -1,special_code_dict = {}):
	_function_enter(_Z_DEBUG_DEBUG)
	model = mdl.upper()
	ml = len(model)
	if ml < 7:
		return model
	if re.match('^[Z2]{2}[1345]\d{3}\w*',model):
		model = 'ZZ' + model[2:]
	elif re.match('^Z[1345]\d{3}\w*',model):
		model = 'ZZ' + model[1:]
	model = _revise_model_general(model,vtype,brand,vcode,vvin,special_code_dict) 
	_function_exit(_Z_DEBUG_DEBUG)
	return mdl

def _revise_model_bj(mdl,vtype='',brand='',vcode='',vvin = -1,special_code_dict = {}):
	_function_enter(_Z_DEBUG_DEBUG)
	model = mdl.upper()
	ml = len(model)
	if ml < 7:
		return model
	#print '--- begin revise model %s ---' % model
	if model[0:3] == '13J': # Normal:  BJ[1345]\d{3}[A-Z]{5}-?[0-9A-Z]*  4 + 5 - 1/2  Main + Tech + '-' + Suffix (2)
		model = model.replace(model[:3],'BJ')
		_debug('model case 13J, changed: ' + str(model), _Z_DEBUG_DEBUG)
		ml -= 1
	elif model[0:2] == '8J':
		model = model.replace(model[:2],'BJ')
		_debug('model case 8J, changed: ' + str(model), _Z_DEBUG_DEBUG)
	elif model[0:2] == '5J':
		model = model.replace(model[:2],'BJ')
		_debug('model case 5J, changed: ' + str(model), _Z_DEBUG_DEBUG)
	if re.match('B[1345]\d{3}[A-Z]{5}-?[0-9A-Z]*',model):
		model = model.replace(model[:1],'BJ')
		_debug('model case B[1345], changed: ' + str(model), _Z_DEBUG_DEBUG)
		ml += 1
	elif re.match('BJJ[1345]\d{3}[A-Z]{5}-?[0-9A-Z]*',model):
		model = model.replace(model[:3],'BJ')
		_debug('model case BJJ[1345], changed: ' + str(model), _Z_DEBUG_DEBUG)
		ml -= 1
	#elif re.match('B[0-9A-Z][1345]\d{3}[A-Z]{5}-[0-9A-Z]*',model):
	#   model = model.replace(model[:2],'BJ')
	idx = model.find('-')
	if idx >= 0 and idx < 7:	# 9 BJ5240GJB
		model = model.replace(model[:idx+1],model[:idx])
		_debug('model case - in 1-6, changed: ' + str(model), _Z_DEBUG_DEBUG)
		ml -= 1
	if re.match('BJBB[A-Z]{5}',model) != None : # 3 + 5, A -, A 5, M:B13
		#print '5: 2 + 5, A -, A 5, M:BB'
		model = model.replace(model[0:4],'BJ1313')
		_debug('model case BJBB, changed: ' + str(model), _Z_DEBUG_DEBUG)
		ml += 2
	#if re.match('BJ[0-9A-Z]{3}[A-Z]{3}',model) != None and model[2:3] != '5' and model[2:6].find('B') >= 0:	# 3 + 5, Y -, N 5, M:B13
	#   print '4: 3 + 5, Y -, N 5, M:B13'
	#   tech = model[2:5]
	#   idx = tech.find('B')
	#   model = model.replace(model[:2+idx+1],model[:2+idx]+'13')
	#   ml += 1
	idx = model.find('-')
	if idx >= 0:
		_debug('model with - ', _Z_DEBUG_DEBUG)
		if model[2:3] != '5' and model[2:3] != 'S':
			_debug('\tmodel case type 134 ', _Z_DEBUG_DEBUG)
			if re.match('BJ\d{3}[A-Z]{5}-',model) != None : # 3 + 5, Y -, A 5, M:-1
				#print '3: 3 + 5, Y -, A 5, M:-1'
				if model[5:6] == 'D' and model[2:3] == '3':
					model = model.replace(model[0:5],model[0:5]+'0')
				elif model[5:6] == 'D' and model[2:3] != '3':
					model = model.replace(model[0:2],model[0:2]+'3')
				elif model[5:6] == 'S' and model[2:3] == '4':
					model = model.replace(model[0:5],model[0:5]+'0')
				elif model[5:6] == 'S' and model[2:3] != '4':
					model = model.replace(model[0:2],model[0:2]+'4')
				else:
					model = model.replace(model[0:5],model[0:5]+'0')
				subm = '' #model[2:6]
				for i in range(2,6):
					subm += vague_C2N(model[i])
				model = model.replace(model[2:6],subm)
				_debug('\t\tmodel case 3+5Y-A5M-1, changed: ' + str(model), _Z_DEBUG_DEBUG)
			if re.match('BJ[0-46-9]\d{3}[A-Z]{5}-?[0-9A-Z]*',model):
				if re.match('[026789]+',model[2:3]) != None:	# 4 + 5, Y -, N 5, M:026 (type error, BJ0)
					#print '1: 4 + 5, Y -, N 5, M:026'
					if model[6:7] == 'D':
						model = model.replace(model[0:3],model[0:2]+'3')
					elif model[6:7] == 'S':
						model = model.replace(model[0:3],model[0:2]+'4')
				_debug('\t\tmodel case 4+5Y-N5M026, changed: ' + str(model), _Z_DEBUG_DEBUG)
				#return model
			if re.match('BJ[0-9A-Z]{4}[A-Z]{5}-+',model) != None and (model[2:3] != '5' or model[2:3] != 'S'):  # 4 + 5, Y -, N 5, M:B8 ( B8 means vague_C2N, vice versa)
				#print '2: 4 + 5, Y -, N 5, M:B8'
				maind = '' #model[2:6]
				for i in range(2,6):
					maind += vague_C2N(model[i])
				model = model.replace(model[2:6],maind)
				_debug('\t\tmodel case 4+5Y-N5MB8, changed: ' + str(model), _Z_DEBUG_DEBUG)
			if re.match('BJ[0-9A-Z]{4}[0-9A-Z]{5}-+',model) != None and (model[2:3] != '5' or model[2:3] != 'S'):   # 4 + 5, Y -, N 5, M:B8 ( B8 means vague_C2N, vice versa)
				#print '10: 4 + 5, A -, N 5, MT:B88B'
				subm = '' #model[2:6]
				for i in range(2,6):
					subm += vague_C2N(model[i])
				model = model.replace(model[2:6],subm)
				subm = ''
				for i in range(6,11):
					subm += vague_N2C(model[i])
				model = model.replace(model[6:11],subm)
			if re.match('BJ\d{4}[0-9A-Z]{5}-+',model) != None and model[2:3] != '5':	# 4 + 5, Y -, A 5, T:8B
				#print '11: 4 + 5, Y -, A 5, T:8B'
				tech = '' #model[6:11]
				for i in range(6,11):
					tech += vague_N2C(model[i])
				model = model.replace(model[6:11],tech)
			if re.match('BJ\d{4}[0-9A-Z]{6}-+',model) != None and model[2:3] != '5' and model.find('13') >= 6:  # 4 + 6, Y -, N 5, T:13B
				#print '12: 4 + 6, Y -, N 5, T:13B'
				tech = model[6:12]
				idx = tech.find('13')
				model = model.replace(model[:6+idx+2],model[:6+idx]+'B')
				ml -= 1
			if re.match('BJ\d{4}[A-Z]{4}-+',model) != None and model[2:3] != '5':   # 4 + 4, Y -, N 5, T:-1 (short of 1 char)
				#print '13: 4 + 4, Y -, N 5, T:-1'
				model = model.replace(model[:8],model[:8]+'F') # add 'F' @ [9]
				ml += 1
			if re.match('BJ\d{4}[A-Z]{6}-+',model) != None and model[2:3] != '5':   # 4 + 4, Y -, N 5, T:+1
				#print '14: 4 + 6, Y -, N 5, T:+1'
				model = model.replace(model[:9],model[:8])  # delete [9]
			if re.match('BJ[0-9A-Z]{4}[A-Z]{4}-+',model) != None and (model[2:3] != '5' or model[2:3] != 'S'):  # 4 + 5, Y -, N 5, M:B8 ( B8 means vague_C2N, vice versa)
				#print '15: 4 + 4, Y -, N 5, MT:B88B'
				idx = model.find('B')
				if idx > 1 and idx < 5:
					model = model.replace(model[:idx+1],model[:idx]+'13')
					ml += 1
				idx13 = model.find('13')
				if idx >= 6:
					model = model.replace(model[:idx+2],model[:idx]+'B')
					ml -= 1
				for cls in 'VDS':
					idx = model.find(cls)
					if idx >= 5 and idx <= 7:
						break
				if idx == 5:
					if model[5:6] == 'D' and model[2:3] == '3':
						model = model.replace(model[0:5],model[0:5]+'0')
					elif model[5:6] == 'D' and model[2:3] != '3':
						model = model.replace(model[0:2],model[0:2]+'3')
					elif model[5:6] == 'S' and model[2:3] == '4':
						model = model.replace(model[0:5],model[0:5]+'0')
					elif model[5:6] == 'S' and model[2:3] != '4':
						model = model.replace(model[0:2],model[0:2]+'4')
					else:
						model = model.replace(model[0:5],model[0:5]+'0')
					subm = '' #model[2:6]
					for i in range(2,6):
						subm += vague_C2N(model[i])
					model = model.replace(model[2:6],subm)
				elif idx == 6:
					subm = '' #model[2:6]
					for i in range(2,6):
						subm += vague_C2N(model[i])
					model = model.replace(model[2:6],subm)
				elif idx == 7:
					model = model.replace(model[:7],model[:6])
				#print model
				subm = ''
				for i in range(6,10):
					subm += vague_N2C(model[i])
				model = model.replace(model[6:10],subm)
				model = model.replace(model[6:8],model[6:8]+'F')
			#print 'rule over: ' + model	
			idx = model.find('B')
			if idx > 1 and idx < 5:
				model = model.replace(model[:idx+1],model[:idx]+'13')
				ml += 1
			idx = model.find('13')
			if idx >= 6:
				model = model.replace(model[:idx+2],model[:idx]+'B')
				ml -= 1
			for cls in 'VDS':
				idx = model.find(cls)
				if idx >= 5 and idx <= 7:
					break
			if idx >= 0 and idx == 5:
				if model[5:6] == 'D' and model[2:3] == '3':
					model = model.replace(model[0:5],model[0:5]+'0')
				elif model[5:6] == 'D' and model[2:3] != '3':
					model = model.replace(model[0:2],model[0:2]+'3')
				elif model[5:6] == 'S' and model[2:3] == '4':
					model = model.replace(model[0:5],model[0:5]+'0')
				elif model[5:6] == 'S' and model[2:3] != '4':
					model = model.replace(model[0:2],model[0:2]+'4')
				else:
					model = model.replace(model[0:5],model[0:5]+'0')
			elif idx >= 0 and idx == 6:
				subm = '' #model[2:6]
				for i in range(2,6):
					subm += vague_C2N(model[i])
				model = model.replace(model[2:6],subm)
			elif idx >= 0 and idx == 7:
				model = model.replace(model[:7],model[:6])
			#print model
			#subm = ''
			#for i in range(6,11):
			#   subm += vague_N2C(model[i])
			#model = model.replace(model[6:11],subm)
		else:   # 5
			_debug('\tmodel case type 5', _Z_DEBUG_DEBUG)
			if re.match('BJ[5S][A-Z0-9]+',model) != None:   # 4 + 4, A -, Y 5, MT:B88B
				#print '30: m + n, A -, Y 5, MT:B88B'
				idx = model.find('V')
				if idx == 5:
					model = model.replace(model[0:5],model[0:5]+'0')
					ml += 1
					subm = '' #model[2:6]
					for i in range(2,6):
						subm += vague_C2N(model[i])
					model = model.replace(model[2:6],subm)
				elif idx == 6:
					subm = '' #model[2:6]
					for i in range(2,6):
						subm += vague_C2N(model[i])
					model = model.replace(model[2:6],subm)
				elif idx == 7:
					model = model.replace(model[:7],model[:6])
					ml -= 1
				if model[2:3] == 'S':
					model = model.replace(model[:3],'BJ5')
				#print model
				idx = model.find('-')
				if idx > 6:
					subm = ''
					for i in range(6,idx):
						subm += vague_N2C(model[i])
					model = model.replace(model[:idx],model[:6]+subm)
	else:   # N -
		_debug('model without - ', _Z_DEBUG_DEBUG)
		if re.match('BJ[0-9A-Z]+$',model) != None and ml >= 9:  # 4 + 5, N -, A 5, MT:8B130
			#print '21: BJ~ , N -, A 5, MT:8B130'
			idx = model.find('B')
			if idx > 1 and idx < 5:
				model = model.replace(model[:idx+1],model[:idx]+'13')
				ml += 1
			idx = model.find('13')
			if idx >= 6:
				model = model.replace(model[:idx+2],model[:idx]+'B')
				ml = ml - 1
			#if model[2:3] == '1':
			#   cls = 'V'
			#elif model[2:3] == '3':
			#   cls = 'D'
			#elif model[2:3] == '4':
			#   cls = 'S'
			#elif model[2:3] == '5':
			#   cls = 'V'
			#idx = model.find(cls)
			#print model
			#if model[6:9] in special_code_dict or model[5:8] in special_code_dict:
			for cls in 'VDS':
				idx = model.find(cls)
				if idx >= 5 and idx <= 7:
					break
			if idx >= 0 and idx == 5:
				if model[5:6] == 'D' and model[2:3] == '3':
					model = model.replace(model[0:5],model[0:5]+'0')
				elif model[5:6] == 'D' and model[2:3] != '3':
					model = model.replace(model[0:2],model[0:2]+'3')
				elif model[5:6] == 'S' and model[2:3] == '4':
					model = model.replace(model[0:5],model[0:5]+'0')
				elif model[5:6] == 'S' and model[2:3] != '4':
					model = model.replace(model[0:2],model[0:2]+'4')
				elif model[5:6] == 'V' and (model[2:3] == '5' and (vtype.find('仓栅')>=0 or vtype.find('特殊')>=0  or vtype.find('厢式')>=0 or vtype.find('罐式')>=0 or vtype.find('专项')>=0  or vtype.find('专用')>=0 )):
					model = model.replace(model[0:5],model[0:5]+'0')
				elif model[5:6] == 'V' and (model[2:3] != '5' and (vtype.find('仓栅')>=0 or vtype.find('特殊')>=0  or vtype.find('厢式')>=0 or vtype.find('罐式')>=0 or vtype.find('专项')>=0  or vtype.find('专用')>=0 )):
					model = model.replace(model[0:2],model[0:2]+'5')
				else:
					model = model.replace(model[0:5],model[0:5]+'0')
				ml += 1
				subm = '' #model[2:6]
				for i in range(2,6):
					subm += vague_C2N(model[i])
				model = model.replace(model[2:6],subm)
			elif idx >= 0 and idx == 6:
				subm = '' #model[2:6]
				for i in range(2,6):
					subm += vague_C2N(model[i])
				model = model.replace(model[2:6],subm)
			elif idx >= 0 and idx == 7:
				model = model.replace(model[:7],model[:6])
				ml -= 1
			#print model
			subm = ''
			if model[2:3] != '5' and model[2:3] != 'S':
				if ml > 11:
					for i in range(6,11):
						subm += vague_N2C(model[i])
					model = model.replace(model[6:11],subm)
					#print model
					model = model.replace(model[:11],model[:11]+'-')
				else:
					for i in range(6,ml):
						subm += vague_N2C(model[i])
					model = model.replace(model[:ml],model[:6]+subm)
			else:   # 5, ????----
				if ml >= 9:
					for i in range(6,9):
						subm += vague_N2C(model[i])
					model = model.replace(model[:9],model[0:6]+subm)

	#print '--- end revise model %s ---' % model
	_function_exit(_Z_DEBUG_DEBUG)
	return model

'''
	Revise a model, from model itself, type, brand and vin code
'''
def modelRevise(mdl,vtype='',brand='',vcode='',vvin = -1,special_code_dict = {}):
	_function_enter(_Z_DEBUG_DEBUG)
	_debug('start to revise Model: ' + str(mdl), _Z_DEBUG_DEBUG)
	model = mdl.upper()
	ml = len(model)
	if ml < 7:
		return model
	if model[0] == 'B'  or model[0:3] == '13J'  or model[0:2] in ['BJ','8J','5J']:
		model = _revise_model_bj(model,vtype)
	elif model[:2] == 'CA' or (re.match('^C[A1345]\w+',model) != None and brand.find('解放') >= 0) or brand.find('解放') >= 0:
		model = _revise_model_ca(model,vtype)
	elif model[:2] in ['DF','EQ'] or re.match('^DF[1345]\w+',model) != None or re.match('^EQ[1345]\w+',model) != None or brand.find('东风') >= 0:
		model = _revise_model_df(model,vtype)
	elif model[:2] == 'SX' or re.match('^[S5]X[1345]\w+',model) != None or brand.find('陕汽') >= 0:
		model = _revise_model_sx(model,vtype)
	elif model[:2] == 'ZZ' or re.match('^[2Z]{2}[1345]\w+',model) != None or brand.find('中国重汽') >= 0 or (re.match('^Z[1345]\d{3}\w+',model) != None and brand.find('中国重汽') >= 0):
		model = _revise_model_zz(model,vtype)
	else:
		model = _revise_model_general(model,vtype,brand,vcode,vvin,special_code_dict) # also put in respective brand function
	_function_exit(_Z_DEBUG_DEBUG)
	return model

def _get_drive_from_model_bj(model,special_code_dict = {}):
	dc = ''
	drive = 'NULL'
	if True:
		if model[2:3] != '5' and len(model)>10:	# 11th drive char
		   dc = model[10:11].lower()
		if 'dangk'.find(dc) >= 0:
		   drive = '4x2'
		#elif 'helpb'.find(dc) >= 0:
		#   drive = '6x'
		#elif 'crmfj'.find(dc) >= 0:
		#   drive = '8x'
		elif dc == 's':
		   drive = '4x4'
		elif dc == 't':
		   drive = '6x6'
		elif dc == 'u':
		   drive = '8x8'
		pass
	return drive

def _get_drive_from_model_df(model,special_code_dict = {}):
	dc = ''
	drive = 'NULL'
		#if model[2:3] != '5' and len(model)>9: # 11th drive char
		#   dc = model[9:10].upper()
		#elif model[2:3] == '5' and len(model)>12:
		#   dc = model[12:13]
		#if dc == '1':
		#   drive = '4x2'
		# for Dongfeng, use VIN-code
	return drive
def _get_drive_from_vin_df(vcode,axis = 0, tires = 0):
	dc = ''
	drive = 'NULL'
	if True:
		#if checkVcode(vcode) == 0 and vcode[0:2] == 'LG':
		# vcode has been checked! 17 vcode HERE!
		dc = vcode[6:7].upper()
		if dc == '1':
			drive = '4x2'
		elif dc == '2':
			drive = '4x4'
		elif dc == '3':
			drive = '6x2'
		elif dc == '4':
			drive = '6x4'
		elif dc == '5':
			drive = '6x6'
		elif dc == '6':
			drive = '8x4'
		elif dc == '7':
			drive = '8x8'
		elif dc == 'A':
			drive = '4x2'
		elif dc == 'B':
			drive = '4x4'
		elif dc == 'C':
			drive = '6x2'
		elif dc == 'D':
			drive = '6x4'
		elif dc == 'E':
			drive = '6x6'
		elif dc == 'F':
			drive = '8x4'
		elif dc == 'G':
			drive = '8x8'
		elif dc == 'H':
			drive = '4x2'
		elif dc == 'J':
			drive = '4x4'
		elif dc == 'K':
			drive = '6x2'
		elif dc == 'L':
			drive = '6x4'
		elif dc == 'M':
			drive = '6x6'
		elif dc == 'N':
			drive = '8x4'
		elif dc == 'P':
			drive = '8x8'
		elif dc == 'R':
			drive = '4x2'
		elif dc == 'S':
			drive = '4x4'
		elif dc == 'T':
			drive = '6x2'
		elif dc == 'U':
			drive = '6x4'
		elif dc == 'V':
			drive = '6x6'
		elif dc == 'W':
			drive = '8x4'
		elif dc == 'X':
			drive = '8x8'
	return drive
def _get_drive_from_model_zz(model,special_code_dict = {}):
	dc = ''
	drive = 'NULL'

	if True:
		if model[2:3] != '5' and len(model)>9: # 11th drive char
			dc = model[9:10].upper()
		elif model[2:3] == '5' and len(special_code_dict) > 0:
			if len(model) > 12 and model[5:6].isdigit() == True and model[6:7].isdigit() == False and model[6:9] in special_code_dict:
				dc = model[12:13].upper()
			elif len(model) > 9 and model[5:6].isdigit() == True and model[6:9] not in special_code_dict:
				dc = model[9:10].upper()
			elif len(model) > 13 and model.find("CLXY") > 0:
				dc = model[13:14].upper()
		elif model[2:3] == '5' :
			return drive
		if dc == '1':
			drive = '4x2'
		elif dc == '2':
			drive = '4x4'
		elif dc == '3':
			drive = '6x2'
		elif dc == '4':
			drive = '6x4'
		elif dc == '5':
			drive = '6x6'
		elif dc == '6':
			drive = '8x4'
		elif dc == '7':
			drive = '8x8'
		elif dc == '8':
			drive = '10x10'
		elif dc == '9':
			drive = '12x10'
		elif dc == '0':
			drive = '12x12'
		elif dc == 'A':
			drive = '8x2'
		elif dc == 'B':
			drive = '10x4'
		elif dc == 'C':
			drive = '6x2' #6x2R
		elif dc == 'D':
			drive = '10x6'
		elif dc == 'E':
			drive = '8x6'
		elif dc == 'F':
			drive = '6x2' #6x2F
	return drive
def _get_drive_from_vin_zz(vcode):
	dc = ''
	drive = 'NULL'
	# vcode has been checked! 17 vcode HERE!
	dc = vcode[5:6].upper()
	if dc == 'A' or dc == 'B' or dc == 'C':
		drive = '4x2'
	elif dc == 'D' or dc == 'E' :
		drive = '4x4'
	elif dc == 'F' or dc == 'G' or dc == 'H':
		drive = '6x2'
	elif dc == 'J' or dc == 'L' or dc == 'M':
		drive = '6x4'
	elif dc == 'S' or dc == 'U' or dc == 'V':
		drive = '6x6'
	elif dc == 'W' or dc == '8' or dc == '7':
		drive = '8x2'
	elif dc == 'N' or dc == 'X' or dc == 'Y':
		drive = '8x4'
	elif dc == 'P' :
		drive = '8x6'
	elif dc == 'Z' or dc == '0' or dc == '1' or dc == '2':
		drive = '8x4'
	elif dc == 'R' or dc == '6' :
		drive = '10x4'
	elif dc == '9' :
		drive = '10x6'
	elif dc == '3' :
		drive = '10x10'
	elif dc == '4' :
		drive = '12x10'
	elif dc == '5' :
		drive = '12x12'
	return drive
def _get_drive_from_model_ca(model,special_code_dict = {}):
	dc = ''
	drive = 'NULL'
	if True:
		if model.find('T1') > 0:
			drive = '6x4'
		elif model.find('T2') > 0:
			drive = '6x2' # 6x2f
		elif model.find('T3') > 0:
			drive = '6x2' # 6x2r
		elif model.find('T4') > 0:
			drive = '8x4'
		elif model.find('T5') > 0:
			drive = '4x4'
		elif model.find('T') > 0: # todo: re.match('CA[0-9A-Z]*T[A-Z]*',model) != None
			drive = '6x6'
		else:
			drive = '4x2'
	return drive
def _get_drive_from_vin_ca(vcode):
	dc = ''
	drive = 'NULL'
	# vcode has been checked! 17 vcode HERE!
	dc = vcode[3:4].upper()
	if dc == 'A' or dc == 'G' or dc == 'N' or dc == 'T' or dc == 'Z':
		drive = '4x2'
	elif dc == 'B' or dc == 'H' or dc == 'P' or dc == 'U' or dc == '0':
		drive = '4x4'
	elif dc == 'C' or dc == 'J' or dc == 'R' or dc == 'V' or dc == '1':
		drive = '6x2'
	elif dc == 'D' or dc == 'K' or dc == 'S' or dc == 'W' or dc == '2':
		drive = '6x4'
	elif dc == 'E' or dc == 'L' or dc == 'X' or dc == '3' :
		drive = '6x6'
	elif dc == 'F' or dc == 'M' or dc == 'Y' or dc == '4' :
		drive = '8x4'
	return drive
def _get_drive_from_model_sx(model,special_code_dict = {}):
	dc = ''
	drive = 'NULL'

	if True:
		if model[2:3] != '5' and len(model)>10: # 11th drive char
			dc = model[10:11].upper()
		elif model[2:3] == '5' and len(special_code_dict) > 0:
			if len(model) > 13 and model[5:6].isdigit() == True and model[6:7].isdigit() == False and model[6:9] in special_code_dict:
				dc = model[13:14].upper()
			elif len(model) > 10 and model[6:9] not in special_code_dict:
				dc = model[10:11].upper()
			elif model.find("CLXY") > 0 and len(model) > 14 :
				dc = model[14:15].upper()
		elif model[2:3] == '5' :
			return drive
		if dc == '1':
			drive = '4x2'
		elif dc == '2':
			drive = '4x4'
		elif dc == '3':
			drive = '6x2'
		elif dc == '4':
			drive = '6x4'
		elif dc == '5':
			drive = '6x6'
		elif dc == '6':
			drive = '8x4'
		elif dc == '7':
			drive = '8x8'
		elif dc == '8':
			drive = '10x10'
		elif dc == '9':
			drive = '6x2' # 6x2R 双前轴
		elif dc == 'A':
			drive = '8x6'
		elif dc == 'B':
			drive = '8x2'
		elif dc == 'C':
			drive = '10x4'
		elif dc == 'D':
			drive = '10x6'
		elif dc == 'E':
			drive = '10x8'
		elif dc == 'F':
			drive = '12x12'
	return drive
def _get_drive_from_vin_sx(vcode):
	dc = ''
	drive = 'NULL'
	# vcode has been checked! 17 vcode HERE!
	dc = vcode[7:8].upper()
	if dc == '1':
		drive = '4x2'
	elif dc == '2':
		drive = '4x4'
	elif dc == '3':
		drive = '6x2'
	elif dc == '4':
		drive = '6x4'
	elif dc == '5':
		drive = '6x6'
	elif dc == '6':
		drive = '8x4'
	elif dc == '7':
		drive = '8x8'
	elif dc == '8':
		drive = '10x10'
	elif dc == '9':
		drive = '6x2' # 6x2R
	elif dc == 'A':
		drive = '8x6'
	elif dc == 'B':
		drive = '8x2'
	elif dc == 'C':
		drive = '10x4'
	elif dc == 'D':
		drive = '10x6'
	elif dc == 'E':
		drive = '10x8'
	elif dc == 'F':
		drive = '12x12'
	return drive
def _get_drive_from_model_jh(model,special_code_dict = {}):
	dc = ''
	drive = 'NULL'
	return drive
def _get_drive_from_model_dy(model,special_code_dict = {}):
	dc = ''
	drive = 'NULL'
	return drive
def _get_drive_from_model_hn(model,special_code_dict = {}):
	dc = ''
	drive = 'NULL'
	return drive
def _get_drive_from_model_bb(model,special_code_dict = {}):
	dc = ''
	drive = 'NULL'
	return drive
def _get_drive_from_model_lz(model,special_code_dict = {}):
	dc = ''
	drive = 'NULL'

	if True:
		if model[2:3] != '5' and len(model) > 8: 
			dc = model[7:8].upper()
			if dc.isdigit():
				dc = model[8:9].upper()
		elif model[2:3] == '5' and len(special_code_dict) > 0:
			if len(model) > 11 and model[5:6].isdigit() == True and model[6:7].isdigit() == False and model[6:9] in special_code_dict:
				dc = model[10:11].upper()
			elif model.find("CLXY") > 0 and len(model) > 12 :
				dc = model[11:12].upper()
		elif model[2:3] == '5' :
			return drive
		#elif model[2:3] == '5' :
		#	if len(model) > 13 and model[5:6].isdigit() == True and model[6:7].isdigit() == False and model[6:9] in special_code_dict:
	if dc == 'A':
		drive = '4x2'
	elif dc == 'C':
		drive = '6x2'
	elif dc == 'D':
		drive = '6x4'
	elif dc == 'E':
		drive = '8x4'
	return drive
def _get_drive_from_model_cq(model,special_code_dict = {}):
	dc = ''
	drive = 'NULL'
	if True:
		if re.match('CQ[1345][0-9]{3}[A-Z]{3}[0-9]{3}',model) != None and len(model)>11:
			dc = model[11:12].upper()
		elif re.match('CQ[1345][0-9]{3}[A-Z]{4}[0-9]{3}',model) != None and len(model)>12:
			dc = model[12:13].upper()
		elif re.match('CQ5[0-9]{3}[A-Z]{8}[0-9]{3}',model) != None and len(model)>16:
			dc = model[16:17].upper()
		elif re.match('CQ5[0-9]{3}[A-Z]{7}[0-9]{3}',model) != None and len(model)>15:
			dc = model[15:16].upper()
		elif re.match('CQ5[0-9]{3}[A-Z]{6}[0-9]{3}',model) != None and len(model)>14:
			dc = model[14:15].upper()
		if dc == '1':
			drive = '4x2'
		elif dc == '2':
			drive = '4x4'
		elif dc == '3':
			drive = '6x2'
		elif dc == '4':
			drive = '6x4'
		elif dc == '5':
			drive = '6x6'
		elif dc == '6':
			drive = '8x4'
		elif dc == '7':
			drive = '8x8'
		elif dc == '8':
			drive = '8x2'
		elif dc == '9':
			drive = '10x4'
		elif dc == '0':
			drive = '12x4'
	return drive
def _get_drive_from_vin_cq(vcode):
	dc = ''
	drive = 'NULL'
	# vcode has been checked! 17 vcode HERE!
	dc = vcode[7:8].upper()
	if dc == '1':
		drive = '4x2'
	elif dc == '2':
		drive = '4x4'
	elif dc == '3':
		drive = '6x2'
	elif dc == '4':
		drive = '6x4'
	elif dc == '5':
		drive = '6x6'
	elif dc == '6':
		drive = '8x4'
	elif dc == '7':
		drive = '8x8'
	elif dc == '8':
		drive = '8x2'
	elif dc == '9':
		drive = '10x4'
	elif dc == '0':
		drive = '12x4'
	return drive

def getDrive(model,vcode = '',axis_s = 0, tires_s = 0, valid_mdl = None, valid_vin = None,special_code_dict={}, model_drive_dict={}):
	_function_enter(_Z_DEBUG_DEBUG)
	#_debug('Function: getDrive()', _Z_DEBUG_DEBUG)
	dc = ''
	drive = 'NULL'  # result
	drive_axis = 'NULL' # axis
	drive_mdl = 'NULL' # model 
	drive_vin = 'NULL' # vin
	drive_dict = 'NULL' # dict
	tw = '0'

	_debug('special_dict content: ' + str(len(special_code_dict)), _Z_DEBUG_DEBUG)
	_debug('drive_dict content: ' + str(len(model_drive_dict)), _Z_DEBUG_DEBUG)
	#print type(drive_dict)
	#print drive_dict
	#print isinstance(drive_dict,dict)
	#if type(drive_dict) is dict: #isinstance(drive_dict,dict)  Syntax Error!!!
	#	print 'drive_dict is dict'
	#else:
	#	print 'drive_dict not dict '
	
	if valid_mdl == None:
		valid_mdl = modelCheckWithVin(model,vcode)
	_debug('valid_mdl: ' + str(valid_mdl), _Z_DEBUG_DEBUG)
	_debug('valid_vin: ' + str(valid_vin), _Z_DEBUG_DEBUG)

	try:
		axis = int(axis_s)
	except:
		axis = 0
	else:
		axis = int(axis_s)
	
	try:
		tires = int(tires_s)
	except:
		tires = 0
	else:
		tires = int(tires_s)
	
	# get drive from axis/tires
	if axis > 0 and axis < 9:
		if axis == 2:
			drive_axis = '4x2'
		elif axis == 0 and ( tires == 4 or tires == 6 ) :
			drive_axis = '4x2'
		elif tires > 4 and tires % 2 == 0 and tires < 25:
			daxis = tires - axis*2 
			if daxis > 0 and daxis <= axis*2:
				drive_axis = str(axis*2) + 'x' + str(daxis)
	_debug('drive_axis: ' + drive_axis, _Z_DEBUG_DEBUG)
				#return drive

	# get drive from model
	if valid_mdl == 0:
		if model[0:2] == 'BJ' and model[2:3].isdigit() : # or ( vcode[0:3] == 'LVB' or vcode[0:3] == 'LRD'):
			drive_mdl = _get_drive_from_model_bj(model,special_code_dict)
		#elif model[0:2] == 'DF' or  model[0:2] == 'EQ' :
		#	drive_mdl = _get_drive_from_model_df(model,special_code_dict)
		elif model[0:2] == 'ZZ' and model[2:3].isdigit() :
			drive_mdl = _get_drive_from_model_zz(model,special_code_dict)
		elif model[0:2] == 'CA' and model[2:3].isdigit() :
			drive_mdl = _get_drive_from_model_ca(model,special_code_dict)
		elif model[0:2] == 'SX' and model[2:3].isdigit() :
			drive_mdl = _get_drive_from_model_sx(model,special_code_dict)
		elif model[0:3] == 'HFC' :
			drive_mdl = _get_drive_from_model_jh(model,special_code_dict)
		elif model[0:2] == 'HN' and model[2:3].isdigit() :
			drive_mdl = _get_drive_from_model_hn(model,special_code_dict)
		elif model[0:3] == 'CGC' :
			drive_mdl = _get_drive_from_model_dy(model,special_code_dict)
		elif model[0:2] == 'ND' and model[2:3].isdigit() :
			drive_mdl = _get_drive_from_model_bb(model,special_code_dict)
		elif model[0:2] == 'LZ' and model[2:3].isdigit() :
			drive_mdl = _get_drive_from_model_lz(model,special_code_dict)
		elif model[0:2] == 'CQ' and model[2:3].isdigit() :
			drive_mdl = _get_drive_from_model_cq(model,special_code_dict)
	else:
		_debug('Error model: ' + model, _Z_DEBUG_DEBUG)
	_debug('drive_mdl: ' + drive_mdl, _Z_DEBUG_DEBUG)
   
	# get drive from dict
	#drive_info_file = file("vehicle-drive-mode.dic","r")
	#lines = drive_info_file.readlines()
	#drive_dict = {}
	#for line in lines:
	#	line = line.strip()
	#	seq = line.split(",")
	#	if len(seq) != 3:
	#		continue
	#	if seq[0] not in drive_dict:
	#		drive_dict[seq[0]] = seq[2]
	#	print "drive dict len: %d" % len(drive_dict)
	#_debug('model_drive_dict len:  ' + len(model_drive_dict), _Z_DEBUG_DEBUG)
	if model in model_drive_dict:
		#if drive != 'NULL' and drive != drive_dict[model]:
		#	#print 'Conflict Dict: ' + drive + ' ' + drive_dict[model]
		#	pass
		drive_dict = model_drive_dict[model]
		#return drive
	_debug('drive_dict: ' + drive_dict, _Z_DEBUG_DEBUG)

	# check drive_mdl
	if re.match('[A-Z]{2}[1345][0-9]{3}[A-Z]+',model) != None:
		tw = model[3:5]
	elif  re.match('[A-Z]{3}[1345][0-9]{3}[A-Z]+',model) != None:
		tw = model[4:6]
	else:
	#   print '6'
		tw = '0'
	tw = int(tw)
	if tw > 0 and tw < 10 and drive_mdl != '4x2':
		drive_mdl = '4x2'
	elif tw == 31 and drive_mdl != 'NULL':
		drive_mdl = '8x4'
	#if drive == '4x2' and (tw.isdigit()==False or (tw.isdigit()==True and int(tw)>20)):
	#   drive = 'error'
	#   continue
	#elif drive == '6x2' and (tw.isdigit()==False or (tw.isdigit()==True and int(tw)<15) or (tw.isdigit()==True and int(tw)>=30)):
	#   drive = 'error'
	#   continue
	#elif drive == '6x4' and (tw.isdigit()==False or (tw.isdigit()==True and int(tw)<20) or (tw.isdigit()==True and int(tw)>=35)):
	#   drive = 'error'
	#   continue
	#elif drive[0] == '8' and (tw.isdigit()==False or (tw.isdigit()==True and int(tw)<30) or (tw.isdigit()==True and int(tw)>=45)):
	#   drive = 'error'
	#   continue
	#else:
	#   drive = 'NULL'
	
	# get drive from vin
	if valid_vin == None:
		valid_vin = checkVcode(vcode)
	if valid_vin == 0 and len(vcode) == 17:	
		if vcode[0:3] == 'LZZ' : #and  model[0:2] == 'ZZ' :
			drive_vin = _get_drive_from_vin_zz(vcode)
		elif vcode[0:3] == 'LGA' or  vcode[0:3] == 'LGD' or vcode[0:3] == 'LGG' or vcode[0:3] == 'LGH' : 
			drive_vin = _get_drive_from_vin_df(vcode)
		elif vcode[0:3] == 'LFW' or vcode[0:3] == 'LFN' : 
			drive_vin = _get_drive_from_vin_ca(vcode)
		elif vcode[0:3] == 'LZG' :
			drive_vin = _get_drive_from_vin_sx(vcode)
		elif vcode[0:3] == 'LZF' :
			drive_vin = _get_drive_from_vin_cq(vcode)
	_debug('drive_vin: ' + drive_vin, _Z_DEBUG_DEBUG)

	# elect drive
	if drive_dict != 'NULL': # and drive_dict not in '12x12 10x10 8x8 6x6 12x10 12x8 12x6':
		drive = drive_dict
	elif drive_axis != 'NULL': # and drive_axis not in '12x12 10x10 8x8 6x6 12x10 12x8 12x6':
		drive = drive_axis
	elif drive_vin != 'NULL': # and drive_vin not in '12x12 10x10 8x8 6x6 12x10 12x8 12x6':
		drive = drive_vin
	elif drive_mdl != 'NULL': # and drive_mdl not in '12x12 10x10 8x8 6x6 12x10 12x8 12x6':
		drive = drive_mdl

	_debug('drive: ' + drive, _Z_DEBUG_DEBUG)
	
	_function_exit(_Z_DEBUG_DEBUG)
	_debug('Exit: getDrive()', _Z_DEBUG_DEBUG)
	return drive

def getBrandFromVin(vcode,vvin = -1):
	brand = '其他'
	vc = vcode[0:3]
	if vc == 'LVB' or vc == 'LRD':
		brand = '欧曼'
	elif vc == 'LGA' or vc == 'LGD' or vc == 'LGG' or vc == 'LGH' :
		brand = '东风'  # 包含柳汽
	elif vc == 'LZZ':
		brand = '重汽'
	elif vc == 'LFW' or vc == 'LFN':
		brand = '解放'
	elif vc == 'LZG':
		brand = '陕汽'
	elif vc == 'LJ1':
		brand = '江淮'
	elif vc == 'LZ5': 
		brand = '华菱'
	elif vc == 'LG6' :
		brand = '大运'
	elif vc == 'LBZ':
		brand = '北奔'
	elif vc == 'LZF':
		brand = '红岩'
	return brand

def getBrand(model,vcode = '',vmodel = -1, vvin = -1, brand0 = ''):
	brd = brand0
	brand = '其他'
	mdl = getModelShortCN(model)
	vc = vcode[0:3]
	if model[0:2] == 'BJ' and (vc == 'LVB' or vc == 'LRD'):
		brand = '欧曼'
	elif (brand0.find('福田')>=0 or brand0.find('欧曼')>=0) and (vc == 'LVB' or vc == 'LRD'):
		brand = '欧曼'
	elif model[0:2] == 'LZ' and ( vc == 'LGA' or vc == 'LGD' or vc == 'LGG' or vc == 'LGH' ) :
		brand = '柳汽'
	elif (brd.find('柳汽') >= 0 or brd.find('乘龙') >= 0  or brd.find('霸龙') >= 0 or brd.find('风行') >= 0 or brd.find('龙卡') >= 0) and ( vc == 'LGA' or vc == 'LGD' or vc == 'LGG' or vc == 'LGH' ) :
		brand = '柳汽'
	elif (model[0:2] == 'DF' or  model[0:2] == 'EQ' ) and ( vc == 'LGA' or vc == 'LGD' or vc == 'LGG' or vc == 'LGH' ) :
		brand = '东风'  
	elif (brd.find('东风') >= 0 or brd.find('天龙') >= 0 or brd.find('天锦') >= 0 or brd.find('大力神') >= 0) and ( vc == 'LGA' or vc == 'LGD' or vc == 'LGG' or vc == 'LGH' ) :
		brand = '东风'  
	elif model[0:2] == 'ZZ' and vc == 'LZZ':
		brand = '重汽'
	elif (brd.find('中国重汽') >= 0 or brd.find('斯达') >= 0 or  brd.find('斯太尔') >= 0 or  brd.find('斯泰尔') >= 0 or brd.find('豪沃') >= 0  or brd.find('濠泺') >= 0 or brd.find('豪泺') >= 0 or brd.find('豪运') >= 0 or brd.find('豪瀚') >= 0  or brd.find('汕德卡牌') >= 0  or brd.find('黄河') >= 0) and vc == 'LZZ':
		brand = '重汽'
	elif (model[0:2] == 'CA' or mdl == 'LZT') and (vc == 'LFW' or vc == 'LFN'):
		brand = '解放'
	elif (brd.find('解放') >= 0 or brd.find('奥威') >= 0  or brd.find('J5P') >= 0 or brd.find('悍威') >= 0 or brd.find('J5M') >= 0 or brd.find('骏威') >= 0 or brd.find('J5K') >= 0 or brd.find('J4R') >= 0 or brd.find('J6H') >= 0 or brd.find('J6L') >= 0 or brd.find('J6M') >= 0 or brd.find('J6P') >= 0 or brd.find('矿威') >= 0 or brd.find('新大威') >= 0 or brd.find('赛龙') >= 0) and (vc == 'LFW' or vc == 'LFN'):
		brand = '解放'
	elif mdl == 'SX' and vc == 'LZG':
		brand = '陕汽'
	elif (brd.find('陕汽') >= 0 or brd.find('德龙') >= 0 or brd.find('德御') >= 0) and vc == 'LZG':
		brand = '陕汽'
	elif model[0:3] == 'HFC' and vc == 'LJ1':
		brand = '江淮'
	elif (brd.find('江淮') >= 0 or brd.find('格尔发') >= 0) and vc == 'LJ1':
		brand = '江淮'
	elif mdl == 'HN' and vc == 'LZ5': # AH星马牌不计入
		brand = '华菱'
	elif (brd.find('华菱') >= 0 or brd.find('汉马') >= 0 or brd.find('星凯马') >= 0) and vc == 'LZ5': # AH星马牌不计入
		brand = '华菱'
	elif (model[0:3] == 'DYX' or model[0:3] == 'DYQ' or model[0:3] == 'CGC' or mdl == 'CJ') and vc == 'LG6' :
		brand = '大运'
	elif (brd.find('大运') >= 0 or brd.find('N8E') >= 0 or brd.find('风景') >= 0 or brd.find('风驰') >= 0 or brd.find('风度') >= 0 or brd.find('征途') >= 0 or brd.find('运途') >= 0 or brd.find('运隆') >= 0) and vc == 'LG6' :
		brand = '大运'
	elif mdl == 'ND' and vc == 'LBZ':
		brand = '北奔'
	elif (brd.find('北奔') >= 0 or brd.find('V3HT') >= 0 or brd.find('V3M') >= 0 or brd.find('V3ET') >= 0 or brd.find('NG80') >= 0) and vc == 'LBZ':
		brand = '北奔'
	elif mdl == 'CQ' and vc == 'LZF':
		brand = '红岩'
	elif (brd.find('红岩') >= 0 or brd.find('金刚') >= 0 or brd.find('杰狮') >= 0) and vc == 'LZF':
		brand = '红岩'
	#else:
	#	if vvin == 0:
	#		brand = getBrandFromVin(vcode)
	return brand

#def getBrand2(model,vcode = '',vmodel = -1, valid_vin = -1,special_code_dict={}):
#	brand = ''
#	return brand

# 0:空,1:柴油,2:汽油,3:天然气,4:电动,5:LNG,6:CNG,7:混合,8:两用燃料,9:双燃料,100:其他
def convert_fuel_str2int(fuelstr):
	ftype = 0
	fstr = fuelstr.strip('\t |-')
	if fstr == '':
		return ftype
	if fstr == '柴油' or fstr == '标准柴油':
		ftype = 1
	elif fstr == '汽油':
		ftype = 2
	elif fstr == '天然气':
		ftype = 3
	elif fstr == '纯电动' or fstr == '电动':
		ftype = 4
	elif fstr == 'LNG':
		ftype = 5
	elif fstr == 'CNG': # NG ?
		ftype = 6
	elif fstr.find('混合') >= 0:
		ftype = 7
	elif fstr.find('两用') >= 0:
		ftype = 8
	elif fstr.find('双') >= 0:  # 汽油/CNG ??
		ftype = 9
	#else:
	#	ftype = 100
	return ftype

def _get_fuel_type_from_model_bj(model):
	ftype = 0
	if model == '' or len(model) < 10:
		return ftype
	fc = model[9:10].upper()
	if fc in 'ABDEFGHJKMN':
		ftype = 1
	elif fc in 'VW':
		ftype = 2
	elif fc in 'C':
		ftype = 3
	elif fc in '08':	# 8: 燃料电池电动
		ftype = 4
	elif fc in '4':
		ftype = 7
	#else:
	#	ftype = 100
	return ftype

def _get_fuel_type_from_vcode_bj(vcode):
	ftype = 0
	if len(vcode) != 17:
		return ftype
	fc = vcode[6:7].upper()
	if fc in 'ABDE':
		ftype = 1
	elif fc in 'VW':
		ftype = 2
	elif fc in 'CT':
		ftype = 3
	elif fc in '04':
		ftype = 4
	elif fc in 'LU':
		ftype = 5
	elif fc in 'RS':
		ftype = 8
	elif fc in '89':
		ftype = 9
	#else:
	#	ftype = 100
	return ftype

def _get_fuel_type_from_engine_model_bj(emodel):
	ftype = 0
	if emodel == '':
		return ftype
	if emodel.find('N') > 0:
		ftype = 3
	#else:
	#	ftype = 100
	return ftype

def _get_fuel_type_from_model_df(model):
	ftype = 0
	if model == '':
		return ftype
	if model[:3] == 'DFL':
		ftype = 1
	#elif model[:3] == 'DFH': # wrong
	#	ftype = 3
	#else:
	#	ftype = 100
	return ftype

def _get_fuel_type_from_vcode_df(vcode):
	ftype = 0
	if len(vcode) != 17:
		return ftype
	fc = vcode[5:6].upper()
	if fc in 'ABCDEFGHJKL':
		ftype = 1
	elif fc in '12345678':
		ftype = 2
	#elif fc in 'MNPRSTU': # 其他燃料？
	#	ftype = 100
	#else:
	#	ftype = 100
	return ftype

def _get_fuel_type_from_model_ca(model):
	ftype = 0
	if model == '':
		return ftype
	if model[-5:].find('M4') >= 0 or model[-5:].find('M5') >= 0 :
		ftype = 3
	elif model[6:].find('K') >= 0 :
		ftype = 1
	else:
		ftype = 2
	return ftype

def _get_fuel_type_from_vcode_ca(vcode):
	ftype = 0
	if len(vcode) != 17:
		return ftype
	fc = vcode[6:7].upper()
	if fc in 'ABCDEFGHJKLMNPRS TU':
		ftype = 1
	elif fc in '123456':
		ftype = 2
	#elif fc in '78': # 汽油代用燃料？
	#	ftype = 2
	#elif fc in 'TU': # 柴油代用燃料？
	#	ftype = 1
	return ftype

def _get_fuel_type_from_model_zz(model):
	ftype = 0
	if model == '':
		return ftype
	if model[-5:].find('E1L') >= 0 :
		ftype = 3
	#else:
	#	ftype = 100
	return ftype

def _get_fuel_type_from_vcode_zz(vcode):
	ftype = 0
	if len(vcode) != 17:
		return ftype
	fc = vcode[6:7].upper()
	if fc in 'BCDEFGHKMNSVWXY56':
		ftype = 1
	elif fc in '123':
		ftype = 3
	return ftype

def _get_fuel_type_from_model_sx(model):
	ftype = 0
	if model == '':
		return ftype
	if not model[-1].isdigit(): 
		if model[-2:] == 'TL':
			ftype = 5
		elif model[-1] == 'T':
			ftype = 3
	return ftype

def _get_fuel_type_from_engine_model_lh(emodel):
	ftype = 0
	if emodel == '':
		return ftype
	if emodel.find('N') > 0:
		ftype = 3
	#else:
	#	ftype = 100
	return ftype

# 0:空,1:柴油,2:汽油,3:天然气,4:电动,5:混合,100:其他
def getFuelType(model, emodel = '', vcode = '',vmodel = -1, vvin = -1):
	ftype = 0
	if vmodel != -1:
		valid_model = vmodel
	else:
		valid_model = modelCheck(model)
	if vvin != -1:
		valid_vcode = vvin
	else:
		valid_vcode = checkVcode(vcode)
	if model[0:2] == 'BJ' and model[2:3].isdigit() : # or ( vcode[0:3] == 'LVB' or vcode[0:3] == 'LRD'):
		if valid_model == 0:
			ftype = _get_fuel_type_from_model_bj(model)
		if ftype == 0:
			if valid_vcode == 0:
				ftype = _get_fuel_type_from_vcode_bj(vcode)
			if emodel and ftype == 0:
				ftype = _get_fuel_type_from_engine_model_bj(emodel)
	elif model[0:2] == 'DF' or ( model[0:2] == 'EQ'  and model[2:3].isdigit() ) :
		if valid_model == 0:
			ftype = _get_fuel_type_from_model_df(model)
		if ftype == 0:
			if valid_vcode == 0:
				ftype = _get_fuel_type_from_vcode_df(vcode)
	elif model[0:2] == 'CA'  and model[2:3].isdigit() :
		if valid_model == 0:
			ftype = _get_fuel_type_from_model_ca(model)
		if ftype == 0:
			if valid_vcode == 0:
				ftype = _get_fuel_type_from_vcode_ca(vcode)
	elif model[0:2] == 'ZZ' and model[2:3].isdigit() :
		if valid_model == 0:
			ftype = _get_fuel_type_from_model_zz(model)
		if ftype == 0:
			if valid_vcode == 0:
				ftype = _get_fuel_type_from_vcode_zz(vcode)
	elif model[0:2] == 'SX' and model[2:3].isdigit() :
		if valid_model == 0:
			ftype = _get_fuel_type_from_model_sx(model)
	elif model[0:3] == 'SQR' :
		ftype = _get_fuel_type_from_engine_model_lh(emodel)
	return ftype

# like GB3847-2005,GB17691-2005(国Ⅳ)
def convert_emission_str2int(estr):
	etype = 0
	if estr == '':
		return etype
	if (estr.find('GB') >= 0 or estr.find('国') >= 0) and (estr.find('Ⅱ') >= 0 or estr.find('II') >= 0):
		etype = 20
	elif estr.find('第二阶段') >= 0 or estr.find('第2阶段') >= 0:
		etype = 20
	elif (estr.find('GB') >= 0 or estr.find('国') >= 0) and (estr.find('Ⅲ') >= 0 or estr.find('III') >= 0):
		etype = 30
	elif estr.find('国3') >= 0 :
		etype = 30
	elif estr.find('第三阶段') >= 0 or estr.find('第3阶段') >= 0:
		etype = 30
	elif (estr.find('GB') >= 0 or estr.find('国') >= 0) and (estr.find('Ⅳ') >= 0 or estr.find('IV') >= 0):
		etype = 40
	elif estr.find('国4') >= 0 :
		etype = 40
	elif estr.find('第四阶段') >= 0 or estr.find('第4阶段') >= 0:
		etype = 40
	elif (estr.find('GB') >= 0 or estr.find('国') >= 0) and (estr.find('Ⅴ') >= 0 or estr.find('V') >= 0):
		etype = 50
	elif estr.find('国5') >= 0 :
		etype = 50
	elif estr.find('第五阶段') >= 0 or estr.find('第5阶段') >= 0:
		etype = 50
	return etype

def _get_emission_type_from_vcode_bj(vcode):
	etype = 0
	if len(vcode) != 17:
		return etype
	#ec = vcode[6:7].upper()
	#if ec in 'ABDE':
	#	etype = 1
	return etype

def _get_emission_type_from_engine_model_bj(emodel):
	etype = 0
	return etype

def get_emission_type(model, emodel = '', vcode = ''):
	etype = 0
	if model[0:2] == 'BJ' and model[2:3].isdigit() : # or ( vcode[0:3] == 'LVB' or vcode[0:3] == 'LRD'):
		etype = _get_emission_type_from_vcode_bj(vcode)
		if etype == 0:
			etype = _get_emission_type_from_engine_model_bj(emodel)
	return etype

	



	



def getFirstFromVlineString(vline):
	if vline == '':
		return ''
	seg = vline.split('|')
	return seg[0]


def get_affiliate(owner,cnum,cratio):
	_function_enter(_Z_DEBUG_DEBUG)
	_debug('' + owner + ', ' + str(cnum) + ', ' + str(cratio), _Z_DEBUG_DEBUG)
	af = '其他'
	if owner == '':
		_debug('1. owner empty', _Z_DEBUG_DEBUG)
		af =  "其他"
	elif owner.find("个人") >=0 or owner.find("个体") >=0 or owner[-3:] == "店" :
		_debug('2. owner contain GeRen,etc.', _Z_DEBUG_DEBUG)
		af =  "个人"
	elif len(owner) <= 9:
		_debug('3. owner name short', _Z_DEBUG_DEBUG)
		af =  "个人"
	elif owner.find("车队") >= 0 :
		_debug('4. owner contain CheDui', _Z_DEBUG_DEBUG)
		af =  "车队"
	elif owner.find("政府") >=0 or owner[-3:] == "局" or owner.find("委员会") >=0 or owner[-3:] == "所" :
		_debug('5. owner contain Zhengfu,etc', _Z_DEBUG_DEBUG)
		af =  "政府"
	elif cnum < 5 and cnum > 0:
		_debug('6. owner vnum < 5', _Z_DEBUG_DEBUG)
		if (cratio - 1.0/cnum < 0.001) and (owner.find("公司") >= 0 or owner[-3:] == "厂" or owner.find("集团") >= 0):
			af =  "公司"
	elif cnum >= 5:
		if cratio > 0.5:
			_debug('7. owner vnum > 5, cratio > 0.5', _Z_DEBUG_DEBUG)
			af =  "挂靠"
		elif cratio > 0.0:
			_debug('8. owner vnum > 5, cratio <= 0.5', _Z_DEBUG_DEBUG)
			af =  "公司"
	else :
		af =  "其他"
	return af

