#!/bin/bash

# 引入配置文件
source test1.ini

# 使用sed命令替换COLOR_GREEN参数的值
sed -i "s/COLOR_GREEN=.*/COLOR_GREEN=lightgreen/g"  test1.ini

# 输出修改后的参数
echo "COLOR_RED: $COLOR_RED"
echo "COLOR_GREEN: $COLOR_GREEN"
echo "COLOR_BLUE: $COLOR_BLUE"
