#!/bin/sh
 
HPHOME=/usr/local/hadoop/bin/
JAR_PACKEGE=/usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar
#JAR_PACKEGE=/home/work/texts/hangshu/hadoop-streaming-2.5.2.jar
#area=$1
#date=$2
EXEC_PATH=$(dirname "$0")
user=`whoami`
#IN_PATH=/online/search_urls/$1*/2014042[0-9]' '/online/search_urls/$1*/2014050[1-3]
 
#IN_PATH=/datax/$1/dui/*/$2*

IN_PATH=/user/work/data/cra/115.231.81.246/20150515/parse.log.2015051502

#OUT_PATH=/user/zhanglu/xuqiu/guanjianci_pvuv/$1/
OUT_PATH=/user/work/test_text/
MAP_FILE=$EXEC_PATH/map.py
RED_FILE=$EXEC_PATH/red.py

#FILE=$EXEC_PATH/guanjianci
 
hadoop fs -rmr $OUT_PATH
hadoop jar $JAR_PACKEGE -numReduceTasks 1 \
     -input $IN_PATH \
     -output $OUT_PATH \
     -mapper $MAP_FILE \
     -file $MAP_FILE \
     -file $RED_FILE \
     -reducer $RED_FILE  \
     -jobconf mapred.job.name=test_text
                                                   
#hadoop fs -cat $OUT_PATH/p* >output/testa
