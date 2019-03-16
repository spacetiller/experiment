#!/bin/sh

day=$1
area=$2
USER=`whoami`
HPHOME=/home/hadoop/hadoop-0.20.2-cdh3u0/bin/
JAR_PACKEGE=/home/hadoop/hadoop-0.20.2-cdh3u0/contrib/streaming/hadoop-streaming-0.20.2-cdh3u0.jar
EXECPATH=$(dirname "$0")
MAP_FILE=$EXECPATH/newhostmap.py
RED_FILE=$EXECPATH/newhostred.py
#IN_PATH=/online/search_urls/jilin/$1
#OUT_PATH=/user/${USER}/zhu/wc_ldrs/$1
IN_PATH=/datax/$2/gene/$1*
OUT_PATH=/user/${USER}/zhu/newhost_stat/$2

echo ----------------------------------------------------
echo $day

hadoop fs -rmr $OUT_PATH
hadoop jar $JAR_PACKEGE -numReduceTasks 20 \
        -input $IN_PATH \
        -output $OUT_PATH \
        -mapper "$MAP_FILE $1" \
        -file $MAP_FILE \
        -file $RED_FILE \
        -reducer $RED_FILE  \
        -inputformat SequenceFileAsTextInputFormat \
	-outputformat org.apache.hadoop.mapred.SequenceFileOutputFormat \
            -jobconf mapred.output.compress=true \
            -jobconf mapred.output.compression.type=BLOCK \
        -jobconf mapred.job.queue.name=bi \
        -jobconf mapred.job.name=$2_wc \
        

#-jobconf stream.map.output.field.separator='\01' 

hadoop fs -ls $OUT_PATH
