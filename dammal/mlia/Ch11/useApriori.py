#!/usr/bin/env python
#-*- coding: utf-8 -*-

import  apriori as ap

dataSet = ap.loadDataSet()
print "Dataset: "
print dataSet
C1 = ap.createC1(dataSet)
print "C1: "
print C1
D = map(set, dataSet)
print "D: "
print D
L1,suppData0 = ap.scanD(D, C1, 0.5)
print "L1: "
print L1



