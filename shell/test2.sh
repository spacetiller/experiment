#!/bin/bash  
 
:<<!
【脚本说明】
1、此脚本适用操作.ini配置文件内容；
2、可以读取或更新指定section指定key的value；
!
 
# key和value的分隔符，即等号两边有没有空格
#delimeter='='
delimeter='='
 
# 操作参数
operate=$1
# 操作文件
file=$2
# 指定section
section=$3
# 指定key
key=$4
# value
value=$5
 
# 提示信息
msg="Please input the param 【<get|set> <file> <section> <key> [value]】"
 
# 定制化shell输出
function custom_print(){
    echo -e "\033[5;34m ***** \033[0m"
    echo -e "\033[32m $@ ! \033[0m"
    echo -e "\033[5;34m ***** \033[0m"
}
 
# 获取配置文件指定section指定key的value
function get_opt() {
    file=$1
    section=$2
    key=$3
    val=$(awk -F "$delimeter" '/\['${section}'\]/{a=1}a==1&&$1~/'${key}'/{print $2;exit}' $file)
    echo ${val}
}
 
# 更新配置文件指定section指定key的value
function set_opt() {
    file=$1
    section=$2
    key=$3
    val=$4
    echo $delimeter ${section} ${key} ${val} ${file}
    awk -F "$delimeter" '/\['${section}'\]/{a=1} (a==1 && "'${key}'"==$1){gsub($2,"'${val}'");a=0} {print $0}' ${file} 1<>${file}
}
 
# 判断输入参数
if [[ -z $operate || $operate = "help" || $operate = "-h" || -z $section || -z $key ]]; then
    custom_print $msg
elif [[ $operate = "get" ]]; then
    val=$(get_opt $file $section $key)
    echo $val
elif [[ $operate = "set" && $value ]]; then
    set_opt $file $section $key $value 
    msg='update success'
    custom_print $msg
else
    custom_print $msg
fi
