#!/bin/bash
# Title: Nacos Configuration Tool
# Description: use awk and sed to read a meta config file and write to nacos conf files, from cdp team
# 
# Author: zhanghui011@chinasofti.com
# @Copyright Free


# ---------------------------------------变量区/参数预处理---------------------------------------

date=`date +"%Y-%m-%d %H:%M:%S"`

#cur_env=`conda env list | sed -n '/\*/p' | awk '{print $1}'`

delimeter=':'

APP="$0"
APPDIR=$(cd `dirname $APP`; pwd)
input_config_file=$APPDIR/config.yaml
output_config_file=$APPDIR/demo-output.yaml

# 提示信息
INIT_MESSAGE="Nacos自动配置工具，来自CDP与数字化营销组"
INIT_USAGE="Usage: `basename $0` [-q] [-l LOGFILE] "
LOG_LEVEL=1     # DEBUG-1, INFO-2, WARN-3, ERROR-4


IS_MACOS=0
[ `uname` == "Darwin" ] && IS_MACOS=1
IS_BSDSED=0
[ -z "`sed -n '3iaaa' $input_config_file 2>/dev/null`" ] && IS_BSDSED=1



# 参数配置
option_verbose=n
option_logfile=$APPDIR/demo.log
# 参数值（tbd）
conf_kafka=
conf_num=0
conf_index=0
conf_keys=()
conf_values=()
# conf_level1_keys=(["jstfrexmple"]="vvvvv")
# conf_level2_keys=(["jstfrexmple"]="vvvvv")
# conf_level3_keys=(["jstfrexmple"]="vvvvv")
# conf_levelup_keys=(["jstfrexmple"]="vvvvv")
# conf_map=(["jstfrexmple"]="vvvvv")  # Bash 4.1.2之后支持，暂不使用



# --------------------------------------- 预处理区 ---------------------------------------



# --------------------------------------- 函数区 ---------------------------------------



# 定制化shell输出
function custom_print(){
    echo -e "\033[30;32m --------------------------------------------------- \033[0m"
    echo -e "\033[32m $@ ! \033[0m"
    echo -e "\033[0;32m --------------------------------------------------- \033[0m"
}
PSdxxx1='\[\033[01;32m\]\u:\[\033[01;36m\]\W\[\033[00m\]\$ '


function usage {   
    custom_print $INIT_USAGE    
}

function date_now {
    echo `date +"%Y-%m-%d %H:%M:%S"`
}

function log() {
    if [ $LOG_LEVEL -gt 1 ]; then return; fi
    local _dd=`date_now`
	echo "${_dd} [LOG] $@"
}

function info() {
    if [ $LOG_LEVEL -gt 2 ]; then return; fi
    local _dd=`date_now`
    echo "${_dd} [INFO] $@"
}

function warn() {
    if [ $LOG_LEVEL -gt 3 ]; then return; fi
    local _dd=`date_now`
    echo "${_dd} [WARN] $@"
}

function error() {
    local _dd=`date_now`
    echo "${_dd} [ERROR] $@"
}

#
#   读取源配置函数，递归调用，将yaml配置树解析出keys和values两个数组
#   @params：1、yaml树的点分key，2、树level
#   @return：None
#   读取：input_config_file
#   写入：conf_keys，conf_values
#
function get_opt_with_yaml_tool() {
    log "Enter function $FUNCNAME >>>>>>>>>"
    # 测试
	#conf_kafka=`cat $input_config_file | shyaml get-value kafka.bootstrap-servers`
    # 参数与变量
    conf_num=$(($conf_num + 1))     # let conf_num++
    local _parent=$1
    local _level=$2     # level暂不使用
    [ $_level ] && let _level++ || _level=1
    echo  $conf_num  ----------  level: $_level
    local _children=
    # 条件不起作用
    #[ $_parent ] && children=`cat $input_config_file | shyaml keys $_parent 2> /dev/null` || children=`cat $input_config_file | shyaml keys 2> /dev/null`
    if [ -z "$_parent" ]; then
        children=`cat $input_config_file | shyaml keys 2> /dev/null`
    else
        children=`cat $input_config_file | shyaml keys $_parent 2> /dev/null`
    fi
    echo parent: $_parent
    echo children: $_children
    #[ $conf_num == 1 ] 
    #if [ ${#children[*]} != 0 ]; then
    if ! [ -z "$_children" ]; then
        for child in $_children; do
            local key=
            echo child: $child
            [ $_parent ] && key=$_parent.$child || key=${child}
            
            get_opt_with_yaml_tool $key $_level
        done
        
    elif [ -n "$_parent" ]; then
        conf_keys[$conf_index]="$_parent"
        # [ $_parent ] && conf_keys[$conf_num]="$key"
        echo index: $conf_index, key: $_parent
        local _value=`cat $input_config_file | shyaml get-value $_parent 2> /dev/null`
        #local _num=$(($conf_num - 1))
        echo index: $conf_index, value: $_value
        conf_values[$_num]=$_value
    else
        error "源配置文件无法读取，退出"
        exit(1)
    fi

    log "Exit function $FUNCNAME ----------------"

}

#
# 获取配置文件函数，shyaml工具无法使用时调用
#
function read_key(){
    log "Enter function $FUNCNAME >>>>>>>>>"
    local flag=0
    # 逐行读取内容
    cat $1 | while read LINE
    do 
        if [ $flag == 0 ];then
            # 属性开始标志 
            if [ "$(echo $LINE | grep "$key:")" != "" ];then
                if [ "$(echo $LINE | grep -E ' ')" != "" ];then
            		# 截取出key值
                	echo "$LINE" | awk -F " " '{print $2}'
                	continue
            	else
            		# 如果关键词后面没有空格，则跳出继续查找
                	continue
            	fi
            fi
        fi
    done
    log "Exit function $FUNCNAME ----------------"
}


# 获取配置文件指定key的value
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


# 主函数
function main() {
	echo "__main__"
	echo $1
	echo $date
}

# --------------------------------------- 主程序区 ---------------------------------------


#  >>>>>>>>>>> 1. 参数处理

while getopts :vd:l:h OPTION
do
    case $OPTION in
        h)
			echo "option -h"
            usage
            exit
            ;;
        v)
			echo "option -v"
            option_verbose=y
            ;;
        l)
			echo "option -l"
            option_logfile=$OPTARG
            ;;
        \?)                       #如果出现错误，则解析为?
			echo "option none"
            usage
            ;;
    esac
done


custom_print $INIT_MESSAGE

echo $date >> $option_logfile
# custom_print $INIT_MESSAGE >> $option_logfile

#read_key $input_config_file




#  >>>>>>>>>>> 2. 读取参数

if command -v shyaml > /dev/null 2>&1 ; then
	info "yaml解析工具存在，开始解析配置"
	get_opt_with_yaml_tool
	# echo $conf_kafka

    info "配置读取完成"
    log 输入配置keys: ${conf_keys[*]}
    log 输入配置values: ${conf_values[*]}

else
    info "yaml解析工具不存在，尝试安装..."
	if command -v pip > /dev/null 2>&1 ; then
	    info "pip命令存在，开始安装yaml解析工具"
	    pip install shyaml
	    info "yaml解析工具已安装"

        info "开始读取配置"
        get_opt_with_yaml_tool
        # echo $conf_kafka
        info "配置读取完成"

        log 输入配置keys: ${conf_keys[*]}
        log 输入配置values: ${conf_values[*]}
	else
	    log "pip命令不存在，采用文本解析获取资源配置"
        error "敬请期待 !"
	fi
fi




#value=`read_key $input_config_file`
#echo kafka.bootstrap-servers: $value


#echo $APPDIR




#  >>>>>>>>>>> 3. 设置参数










#  >>>>>>>>>>> 4. 完成











main



















