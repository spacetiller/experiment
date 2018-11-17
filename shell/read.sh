#!/bin/sh

YESTERDAY=$1
TWODAYSAGO=$(date +%Y%m%d -d "1 days ago ${YESTERDAY}")
#YESTERDAY=$(date +%Y%m%d -d "3 days ago")
#TWODAYSAGO=$(date +%Y%m%d -d "4 days ago")
EXECPATH=$(dirname "$0")

echo $EXECPATH

while read AREA
do
	a=1
#echo $AREA
done < a.txt
