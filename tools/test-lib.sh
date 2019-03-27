#!/bin/bash
#
#   Notice: the baked file is actually yesterday, so the date in the file should be -1 day
#
#
. ./zutil.sh
date_hoy=`date +%Y%m%d`
date_ayer=`date -d "-1 day $date_hoy" +%Y%m%d`
year=`date -d $date_hoy +%Y`
month=`date -d $date_hoy +%m`
day=`date -d $date_hoy +%d`
ts_hoy=`date -d "$date_hoy" +%s`000

zprint "Hello,Shell Lib!"

