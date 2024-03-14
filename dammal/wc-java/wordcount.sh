#!/bin/sh

EXECPATH=$(dirname "$0")
EXECPATH=/home/coc/ade_dsp
HPHOME=/home/hadoop/hadoop/bin/
JAR_PACKEGE=/usr/local/hadoop/contrib/streaming/hadoop*streaming.jar

if [[ $# -ge 1 ]]; then
    day=$1
else
    day=`date -d "today" "+%Y%m%d"`
fi
echo $day
day="20150515"

IN_PATH=/user/work/data/src/0515
OUT_PATH=/user/work/data/src/wcout

#test whether input path exists
$HPHOME/hadoop fs -ls $IN_PATH >/dev/null 2>&1
if [ $? -ne 0 ] 
then
  echo "Fatal Error! Input path doesn't exist!"
  echo "Info: input path:"$IN_PATH
  exit 1
fi


echo $IN_PATH, $OUT_PATH 
${HPHOME}hadoop fs -rmr $OUT_PATH
${HPHOME}hadoop jar WordCount.jar com.felix.WordCount $IN_PATH $OUT_PATH
${HPHOME}hadoop fs -ls $OUT_PATH

exit 0
