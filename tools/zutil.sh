#!/bin/bash
EXEC_PATH=$(dirname "$0")

#
#   Notice: the baked file is actually yesterday, so the date in the file should be -1 day
#
#

# prepare
date_hoy=`date +%Y%m%d`

lzop_home=/usr/bin


function zprint(){
	msg=$1
	echo $date_hoy $msg
}

#
# $1: msg
# $2: FILE NAME
# $3: LOCATION, maybe IP/server-name/dir
function echo_with_time(){
    if [ $# -le 1 ];then
        echo [`date +"%Y-%m-%d %H:%M:%S"`] $1
    elif [ $# -eq 2 ];then
        echo [`date +"%Y-%m-%d %H:%M:%S"`] $2: $1
    elif [ $# -eq 3 ];then
        echo [`date +"%Y-%m-%d %H:%M:%S"`] $2 @ $3: $1
    else
        echo [`date +"%Y-%m-%d %H:%M:%S"`] $1
    fi
}




