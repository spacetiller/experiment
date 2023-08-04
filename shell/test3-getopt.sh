#!/bin/bash 
QUIET=
VERBOSE=
DEVICE=
LOGFILE=/tmp/default
 
usage()
{
    echo "Usage: `basename $0` [-qv] [-l LOGFILE] -d DEVICE input_file [input_file2...]"
    exit 1
}
 
[ $# -eq 0 ] && usage
 
#option_string以冒号开头表示屏蔽脚本的系统提示错误，自己处理错误提示。
#后面接合法的单字母选项，选项后若有冒号，则表示该选项必须接具体的参数
while getopts :qvd:l: OPTION
do
    case $OPTION in
        q)
            QUIET=y
            ;;
        v)
            VERBOSE=y
            ;;
        d)
            DEVICE=$OPTARG        #$OPTARG为特殊变量，表示选项的具体参数
            ;;
        l)
            LOGFILE=$OPTARG
            ;;
        \?)                       #如果出现错误，则解析为?
            usage
            ;;
    esac
done
 
#$OPTIND为特殊变量，表示第几个选项，初始值为1
shift $(($OPTIND - 1))      #除了选项之外，该脚本必须接至少一个参数
if [ $# -eq 0 ]; then
    usage
fi
 
if [ -z "$DEVICE" ]; then   #该脚本必须提供-d选项
    echo "You must specify DEVICE with -d option"
    exit
fi
 
 
echo "you chose the following options.."
echo "Quiet=$QUIET VERBOSE=$VERBOSE DEVICE=$DEVICE LOGFILE=$LOGFILE"
 
for file in $@          #依次处理剩余的参数
do
    echo "Processing $file"
done