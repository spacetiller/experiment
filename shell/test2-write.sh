#/usr/bin/env bash
 
base_path=$(cd `dirname $0`; pwd)
cba_ini=$base_path/test2.ini
name=gege
  
awk -F "=" '/\[student2\]/{a=1} (a==1 && "name"==$1){gsub($2,"'${name}'");a=0} {print $0}' $cba_ini 1<>$cba_ini
