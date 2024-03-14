#!/bin/sh
 
month=`date "+%Y%m%d"`
echo $month

HPHOME=/usr/local/hadoop/bin/
JAR_PACKEGE=/usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-*.jar
#JAR_PACKEGE=/home/work/texts/hangshu/hadoop-streaming-2.5.2.jar
#area=$1
#date=$2
EXEC_PATH=$(dirname "$0")
user=`whoami`

IN_PATH_1=/user/work/data/src/$month/p*

OUT_PATH=/user/work/data/src/cipin/$month/
MAP_FILE=$EXEC_PATH/map_cipin.py
RED_FILE=$EXEC_PATH/red_cipin.py

 
hadoop fs -rmr $OUT_PATH
hadoop jar $JAR_PACKEGE -numReduceTasks 1 \
     -input $IN_PATH_1 \
     -output $OUT_PATH \
     -mapper $MAP_FILE \
     -file $MAP_FILE \
     -file $RED_FILE \
     -reducer $RED_FILE  \
     -jobconf mapred.job.name=test_text_2
