#!/usr/bin/env python
#-*- coding: utf-8 -*-
#coding:utf-8
import itertools
import sys
import os
home = os.getenv('HOME')
sys.path.append(home + '/zjxl/tools')
import zutil 

class Apriori:
	def __init__(self,min_sup=0.49,dataDic={}):
		print '----------------__init__()'
		self.data = dataDic
		self.size = len(dataDic) #Get the number of events
		self.min_sup = min_sup
		self.min_sup_val = min_sup * self.size #这个数值是频繁算法的分子整数部分
		print 'len: ' + str(self.size) + ', min_sup: ' + str(self.min_sup) + ', min_sup_val: ' + str(self.min_sup_val)
	def find_frequent_1_itemsets(self):
		print '----------------find_frequent_1_itemsets()'
		FreqDic = {} #{itemset1:freq1,itemsets2:freq2}  不管频繁度如何，先计算频繁度，然后装到这里面
		for event in self.data: #event表示字典里的键值，比如T100
			for item in self.data[event]:
				if item in FreqDic: #该成员是否出现过，出没出现过都要对它进行赋值
					FreqDic[item] += 1 #出现过则+1
				else:
					FreqDic[item] = 1 #没出现过则初始值为1
		print FreqDic
		L1 = []
		for itemset in FreqDic: #遍历第一轮“频繁”的成员
			if FreqDic[itemset] >= self.min_sup_val: #如果频繁度大于设定值
				L1.append([itemset]) #将该成员推入列表,仅仅是将成员推入列表，频度不管
		print L1
		return L1

	def has_infrequent_subset(self,c,L_last,k): #这是一个进行排列组合的函数
		print '----------------has_infrequent_subset()'
		subsets = list(itertools.combinations(c,k-1)) #在列表c中选择k-1个元素进行无序组合
		for each in subsets: #遍历这些组合的情况
			each = list(each) #把元素强制转换成列表
			if each not in L_last: #如果上一轮筛选出的集合中的成员没有在该组合中出现，则返回一个True，出现过则继续遍历所有组合的情况
				return True
		return False
			
	def apriori_gen(self,L_last): #L_last means frequent(k-1) itemsets 难点！！！
		print '----------------apriori_gen()'
		print L_last
		k = len(L_last[0]) + 1 #len()对于列表，则返回成员的个数 如['I1','I2']就返回2
		Ck = [] #候选项集集合
		for itemset1 in L_last: #循环遍历L_last中的成员
			for itemset2 in L_last:
				#join step
				#print '......'
				#print itemset1 
				#print itemset2
				flag = 0
				for i in range(k-2):
					#print str(i) + itemset1[i]
					if itemset1[i] != itemset2[i]:
						flag = 1 #the two itemset can't join
						break
				if flag == 1:
					continue
				if itemset1[k-2] < itemset2[k-2]:
					c = itemset1 + [itemset2[k-2]] #例：['I1']<['I2']成立，则推入一个['I1','I2']，并且先不计算它的频繁度
				else:
					continue
					 #pruning setp
				if self.has_infrequent_subset(c,L_last,k):
					continue
				else:
					Ck.append(c) #候选项集集合,还没有计算频繁度，先把各种组合扔进去
				print Ck
		print '----------------apriori_gen() end ----'
		return Ck

	def do(self):
		print '----------------do()'
		L_last = self.find_frequent_1_itemsets()
		L = L_last
		i = 0
		while L_last != []: #只要本组频繁项集不空则继续循环
			Ck = self.apriori_gen(L_last) #候选项集集合(仅仅是各种排列组合，没筛选频繁度)推入Ck中
			FreqDic = {}
			for event in self.data: #遍历原始Data数据
				#get all suported subsets
				for c in Ck: #遍历候选的所有项集集合
					if set(c) <= set(self.data[event]):#set()表示无序不重复元素集,如果c元素集是原始数据这个集合的子集
						if tuple(c) in FreqDic: #如果元组c在字典中
							FreqDic[tuple(c)]+=1 #这个元组的值+1，即又出现了一次
						else:
							FreqDic[tuple(c)]=1
			print FreqDic #将候选项集集合，以及出现的次数，以字典的形式打印出来，到这里时仍然没计算频繁度
			Lk = [] #满足频繁度集合的列表
			for c in FreqDic: #遍历字典里的所有候选集合
				if FreqDic[c] > self.min_sup_val: #如果大于设定的频繁度
					Lk.append(list(c)) #将该列表推入列表Lk中
			L_last = Lk #将该列表定义为满足频繁度的最后一组列表
			L += Lk #最终结果的列表为L
		return L

#******Test******
'''
Data = {'T100':['I1','I2','I5'],
		'T200':['I2','I4'],
		'T300':['I2','I3'],
		'T400':['I1','I2','I4'],
		'T500':['I1','I3'],
		'T600':['I2','I3'],
		'T700':['I1','I3'],
		'T800':['I1','I2','I3','I5'],
		'TA00':['I2','I5'],
		'TB00':['I3','I5'],
		'T900':['I1','I2','I3']}
'''
Data = {'T100':['C','D'],
		'T200':['A','B','C'],
		'T300':['A','B','F'],
		'T400':['A','C','D','F']}

a=Apriori(dataDic=Data)
print a.do()




