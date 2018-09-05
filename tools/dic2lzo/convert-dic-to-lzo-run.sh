#!/bin/bash
EXEC_PATH=$(dirname "$0")
HPHOME=/opt/cloudera/parcels/CDH-5.0.0-1.cdh5.0.0.p0.47
JAR_PACKAGE=/opt/cloudera/parcels/CDH-5.0.0-1.cdh5.0.0.p0.47/lib/hadoop-mapreduce/hadoop-streaming-2.3.0-cdh5.0.0.jar
#year=2015
#month=11
#day=01
#factory=foton

if [[ $# -lt 1 ]];then
    echo 'Please add file trunk.  eg. #./convert-dic-to-lzo-run.py file-no-suffix'
    exit
fi
trunk=$1
todir=/user/h_zhanghui/dict

MAP_FILE=$EXEC_PATH/convert-dic-to-lzo-map.py
RED_FILE=$EXEC_PATH/convert-dic-to-lzo-map.py
	IN_PATH=/user/h_zhanghui/dict/$trunk\.dic
	$HPHOME/bin/hadoop fs -test -e $IN_PATH
	if [ $? -ne 0 ];then
		echo 'Error: IN_PATH not exist!!!!!!!!!!!!!!!!!'
		exit
	fi
	OUT_PATH=/user/h_zhanghui/middledata/dic2lzo/output
	$HPHOME/bin/hadoop fs -test -e $OUT_PATH
	if [ $? -ne 0 ];then
		echo "OUT_PATH not exist, mkdir: $OUT_PATH "
		$HPHOME/bin/hadoop fs -mkdir -p $OUT_PATH
	fi

	echo "Removing $OUT_PATH ..."
    $HPHOME/bin/hadoop fs -rm -r -skipTrash $OUT_PATH

	echo "Calculating $IN_PATH ..."
    $HPHOME/bin/hadoop jar $JAR_PACKAGE \
        -D mapred.job.queue.name=bdev \
	    -D mapred.job.inputformat.class=com.hadoop.mapreduce.LzoTextInputFormat \
    	-D mapreduce.output.fileoutputformat.compress=true \
  		-D mapreduce.output.fileoutputformat.compress.codec=com.hadoop.compression.lzo.LzopCodec \
        -numReduceTasks 1 \
        -input $IN_PATH \
        -output $OUT_PATH \
        -file $MAP_FILE \
        -file $RED_FILE \
        -mapper $MAP_FILE \
        -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
        -reducer $RED_FILE

	#	-cmdenv "car_day=$date1" \
	# -D map.output.key.field.separator="," \
	# -D num.key.fields.for.partition=4  \

    $HPHOME/bin/hadoop fs -ls $OUT_PATH
	
	$HPHOME/bin/hadoop fs -mv $OUT_PATH/part-00000.lzo $todir/$trunk\.lzo
