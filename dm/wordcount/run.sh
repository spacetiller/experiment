#!/bin/sh
 
ddate=`date "+%Y%m%d"`
ddate='20150515'
echo $ddate

HPHOME=/home/hadoop/hadoop/
JAR_PACKEGE=$HPHOME/share/hadoop/tools/lib/hadoop-streaming-*.jar
EXEC_PATH=$(dirname "$0")
user=`whoami`
#IN_PATH=/online/search_urls/$1*/2014042[0-9]' '/online/search_urls/$1*/2014050[1-3]
 
#IN_PATH=/datax/$1/dui/*/$2*

hadoop fs -mkdir /user/work/data/cra/115.231.81.248/$ddate/
#hadoop fs -mkdir /user/work/data/cra/115.231.81.246/$ddate/

IN_PATH_1=/user/work/data/cra/115.231.81.248/$ddate/parse.log.$ddate*

OUT_PATH=/user/work/data/src/wc-1/
MAP_FILE=$EXEC_PATH/map-wc.py
RED_FILE=$EXEC_PATH/red-wc.py

#FILE=$EXEC_PATH/guanjianci
 
hadoop fs -rmr $OUT_PATH
hadoop jar $JAR_PACKEGE -numReduceTasks 1 \
     -input $IN_PATH_1 \
     -output $OUT_PATH \
     -mapper $MAP_FILE \
     -file $MAP_FILE \
     -file $RED_FILE \
     -reducer $RED_FILE  \
     -jobconf mapred.job.name=test_text_2
