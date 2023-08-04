#/usr/bin/env bash
 
base_path=$(cd `dirname $0`; pwd)
cba_ini=$base_path/test2.ini
  
aaa=`awk -F '=' '/\[student1\]/{a=1}a==1&&$1~/name/{print $2;exit}' $cba_ini`
echo $aaa
