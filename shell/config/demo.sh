#!/bin/bash
# Title: Nacos Configuration Tool
# Description: use awk and sed to read a meta config file and write to nacos conf files, from cdp team
# 
# Author: zhanghui011@chinasofti.com
# @All Copyright Free
#

# ---------------------------------------变量/参数区---------------------------------------

date=`date +"%Y-%m-%d %H:%M:%S"`

#cur_env=`conda env list | sed -n '/\*/p' | awk '{print $1}'`

delimeter=':'

# 常量大写
APP=`basename $0`
APPEXE="$0"
APPDIR=$(cd `dirname $APPEXE`; pwd) # 应用数据分离，不cd修改主目录
# 变量小写
input_config_file=$APPDIR/config.yaml
output_config_file=$APPDIR/output.yaml

# 提示信息
INIT_MESSAGE="Nacos自动配置工具，来自CDP与数字化营销组\n 若不指定输入配置文件，默认本目录下config.yaml\n 若不指定输出配置文件，默认本目录下output.yaml"
INIT_USAGE="Usage: $APP [-q] [-l LOGFILE] \n\t-q 安静模式，日志不输出到屏幕"
LOG_LEVEL=1     # DEBUG-1, INFO-2, WARN-3, ERROR-4


is_macos=0
[ `uname` == "Darwin" ] && is_macos=1
is_bsdsed=0
[ -z "`sed -n '3iaaa' $input_config_file 2>/dev/null`" ] && is_bsdsed=1


# 参数配置
option_quiet=0
option_verbose=n
option_logfile=$APPDIR/demo.log
# 参数值（tbd）
conf_kafka=
conf_num=0
conf_index=0
conf_keys=()
conf_values=()
last_section=
last_key=
# conf_level1_keys=(["jstfrexmple"]="vvvvv")
# conf_level2_keys=(["jstfrexmple"]="vvvvv")
# conf_level3_keys=(["jstfrexmple"]="vvvvv")
# conf_levelup_keys=(["jstfrexmple"]="vvvvv")
# conf_map=(["jstfrexmple"]="vvvvv")  # Bash 4.1.2之后支持，暂不使用

stat_total=0
stat_real=0

# --------------------------------------- 预处理区 ---------------------------------------



# --------------------------------------- 函数区 ---------------------------------------



# 定制化shell输出
function custom_print(){
    echo -e "\033[30;32m --------------------------------------------------- \033[0m"
    echo -e "\033[32m $@ \033[0m"
    echo -e "\033[0;32m --------------------------------------------------- \033[0m"
}
PSdxxx1='\[\033[01;32m\]\u:\[\033[01;36m\]\W\[\033[00m\]\$ '

function usage {   
    echo -e $INIT_USAGE    
}

function date_now {
    echo `date +"%Y-%m-%d %H:%M:%S"`
}

function log() {
    if [ $LOG_LEVEL -gt 1 ]; then return; fi
    # 局部变量下划线
    local _dd=`date_now`
	echo "${_dd} [LOG] $@"
    echo "${_dd} [LOG] $@" >> $option_logfile
}

function info() {
    if [ $LOG_LEVEL -gt 2 ]; then return; fi
    local _dd=`date_now`
    echo "${_dd} [INFO] $@"
    echo "${_dd} [INFO] $@" >> $option_logfile
}

function warn() {
    if [ $LOG_LEVEL -gt 3 ]; then return; fi
    local _dd=`date_now`
    echo "${_dd} [WARN] $@"
    echo "${_dd} [WARN] $@" >> $option_logfile
}

function error() {
    local _dd=`date_now`
    echo "${_dd} [ERROR] $@"
    echo "${_dd} [ERROR] $@" >> $option_logfile
}

#
#   读取源配置函数，递归调用，将yaml配置树解析出keys和values两个数组
#   @params：1、yaml树的点分key，2、树level
#   @return：None
#   读取：input_config_file
#   写入：conf_keys，conf_values
#
function read_opt_with_yaml_tool() {
    #log "Enter function $FUNCNAME >>>>>>>>>"
    # 测试
	#conf_kafka=`cat $input_config_file | shyaml get-value kafka.bootstrap-servers`
    # 参数与变量
    conf_num=$(($conf_num + 1))     # let conf_num++
    local _parent=$1
    local _level=$2     # level暂不使用
    [ $_level ] && let _level++ || _level=1
    log $conf_num  ----------  level: $_level
    local _children=
    # 条件不起作用
    #[ $_parent ] && children=`cat $input_config_file | shyaml keys $_parent 2> /dev/null` || children=`cat $input_config_file | shyaml keys 2> /dev/null`
    # 是否首次执行
    if [ -z "$_parent" ]; then
        _children=`cat $input_config_file | shyaml keys 2> /dev/null`
    else
        _children=`cat $input_config_file | shyaml keys $_parent 2> /dev/null`
    fi
    #echo parent: $_parent
    #echo children: $_children
    #[ $conf_num == 1 ] 
    #if [ ${#children[*]} != 0 ]; then
    if ! [ -z "$_children" ]; then
        for child in $_children; do
            local key=
            #echo child: $child
            [ $_parent ] && key=$_parent.$child || key=${child}
            # [ $_parent ] && conf_keys[$conf_num]="$key"
            read_opt_with_yaml_tool $key $_level
        done
        
    elif [ -n "$_parent" ]; then
        conf_keys[$conf_index]="$_parent"
        log index: $conf_index, key: $_parent
        local _value=`cat $input_config_file | shyaml get-value $_parent 2> /dev/null`
        #local _num=$(($conf_num - 1))
        conf_values[$conf_index]=$_value
        log index: $conf_index, value: $_value
        let conf_index++
    else    # 首次执行，而且没有子节点
        error "源配置文件无有效配置，退出！"
        exit 1
    fi

    #log "Exit function $FUNCNAME ----------------"

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


#
#   修改目标配置文件，源配置已读取到keys和values两个数组
#   @params：1、section-上面一行的行首关键字，2、key，需要替换的关键字，3、value，替换值，4、需要修改的文件
#   @return：None
#   注意：由于修改逻辑是采用sed对于下一行的预读，因此配置的关键字取决于当前行的行首关键字和下一行的行首关键字
#        造成的限制：配置项次序必须一致，否则不起作用
#   todo: 通过组合sed的-e命令，针对一个文件一次执行
#
function write_one_key_to_file() {
    log "Enter function $FUNCNAME >>>>>>>>>"

    local _section=$1
    local _key=$2
    local _value=$3
    local _output_file=$4
    log $1 - $2 - $3 - $4
    
    if [[ "$_key" =~ "." ]]; then   # 递归key
        _section=${_key%%.*}
        _key=${_key#*.}
        write_one_key_to_file $_section $_key $_value $_output_file
    elif [[ "$_section" == "$_key" ]]; then     # 单层配置项，如：port:8080
        # 预处理，统计
        local _res=`sed -E -n -e "s/^${_key}: .*/${_key}: ${_value}/" $_output_file`
        ! [ -z "$_res" ] && let stat_real++
        # 执行
        sed -E -i".bak" -e "s/^${_key}: .*/${_key}: ${_value}/" $_output_file
        log "完成单配置项：(行首$_key: *) -> ($_key: $_value)"
    else
        if [ -z "$last_section" ];then  # 首次修改
            last_section=$_section
            last_key=$_key
            log 11: $last_section, $last_key
        elif [ ""$_section == ""$last_section ];then    # 同section，根据上下key匹配
            _section=$last_key
            last_key=$_key
            log 22: $last_section, $last_key
        else
            last_section=$_section
            last_key=$_key
            log 33: $last_section, $last_key
        fi
        # 预处理，统计
        local _res=`sed -E -n -e "
        /${_section}:.*$/ {
            n
            s/(${_key}:) (.*)/\1 $_value/p
        }" $_output_file`
        ! [ -z "$_res" ] && let stat_real++
        # 执行
        sed -E -i".bak" -e "
        /${_section}:.*$/ {
            n
            s/(${_key}:) (.*)/\1 $_value/g
        }" $_output_file 
        log "完成配置项：$_section/$_key: * -> $_section/$_key: $_value"

    fi
    
    log "Exit function $FUNCNAME ----------------"
}
 

#
#   修改目标配置文件，源配置已读取到keys和values两个数组
#   @params：
#   @return：None
#   读取：conf_keys，conf_values
#   写入：output_config_file
#   
function write_configs_all() {
    log "Enter function $FUNCNAME >>>>>>>>>"
    
    local _output_file=$1
    [ -z $_output_file ] && _output_file=$output_config_file

    echo $_output_file
    cp ${_output_file} ${_output_file}.orig
    for (( i = 0; i < ${#conf_values[@]}; ++i )); do
        echo "${conf_keys[$i]}: ${conf_values[$i]}"
        local _section=${conf_keys[$i]%%.*}
        local _key=${conf_keys[$i]#*.}
        local _value=${conf_values[$i]}
        
        write_one_key_to_file $_section $_key $_value $_output_file

    done

    log "Exit function $FUNCNAME ----------------"
}

function process_params() {
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
}

# 主函数
function main() {
	echo "__main__"
}

# --------------------------------------- 主程序区 ---------------------------------------


#  >>>>>>>>>>> 1. 参数处理  >>>>>>>>>>>

custom_print $INIT_MESSAGE

process_params $@


echo $date >> $option_logfile
# custom_print $INIT_MESSAGE >> $option_logfile

#read_key $input_config_file




#  >>>>>>>>>>> 2. 读取参数  >>>>>>>>>>>

if command -v shyaml > /dev/null 2>&1 ; then
	info "yaml解析工具存在，开始解析配置"
	read_opt_with_yaml_tool
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

        info "开始读取配置..."
        read_opt_with_yaml_tool
        # echo $conf_kafka
        info "配置读取完成！"

        log 输入配置keys: ${conf_keys[*]}
        log 输入配置values: ${conf_values[*]}
	else
	    log "pip命令不存在，采用文本解析获取资源配置"
        error "敬请期待！"
	fi
fi




#value=`read_key $input_config_file`
#echo kafka.bootstrap-servers: $value


#echo $APPDIR




#  >>>>>>>>>>> 3. 设置参数  >>>>>>>>>>>

info "配置开始写入..."

write_configs_all

info "配置写入完成！"






#  >>>>>>>>>>> 4. 结论  >>>>>>>>>>>

stat_total=${#conf_values[@]}
info "配置修改完成，共配置替换 ${stat_total} 项，实际完成 ${stat_real} 项"
info "------<结束>------"





