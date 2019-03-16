#!/bin/sh

./host.sh 20140701 jilin_jilin >> host.log 2>&1
./newhost.sh 20140701 jilin_jilin >> newhost.log 2>&1
hadoop fs -text  /user/dm/zhu/newhost_stat/jilin_jilin/part-000* > jilin_0701_url_num
awk '{sum+=$1}END{print sum}' urfile

sum=0
while read LINE
do
	((sum+=$LINE)) > /dev/null 2>&1
done < jilin_0701_url_num
echo $sum
