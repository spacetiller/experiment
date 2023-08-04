#!/bin/sh

file=/dir1/dir2/dir3/my.file.txt
echo 'file='$file

echo '${file#*/} : ----------------------'
echo ${file#*/} #删掉第一个 / 及其左边的字符串 #dir1/dir2/dir3/my.file.txt
echo '${file##*/} : ----------------------'
echo ${file##*/} #删掉最后一个 /  及其左边的字符串 #my.file.txt
echo '${file#*.} : ----------------------'
echo ${file#*.} #删掉第一个 .  及其左边的字符串 #file.txt
echo '${file##*.} : ----------------------'
echo ${file##*.} #删掉最后一个 .  及其左边的字符串 #txt
echo '${file%/*} : ----------------------'
echo ${file%/*} #删掉最后一个  /  及其右边的字符串 #/dir1/dir2/dir3
echo '${file%%/*} : ----------------------'
echo ${file%%/*} #删掉第一个 /  及其右边的字符串 #(空值)
echo '${file%.*} : ----------------------'
echo ${file%.*} #删掉最后一个  .  及其右边的字符串 #/dir1/dir2/dir3/my.file
echo '${file%%.*} : ----------------------'
echo ${file%%.*} #删掉第一个  .   及其右边的字符串 #/dir1/dir2/dir3/my

echo '${file/dir/DIR} : ----------------------'
echo ${file/dir/DIR} #替换第一个  .   及其右边的字符串 #/dir1/dir2/dir3/my
echo '${file//dir/DIR} : ----------------------'
echo ${file//dir/DIR} #替换全部  .   及其右边的字符串 #/dir1/dir2/dir3/my
echo '${file/#\/dir/\/DIR} : ----------------------'
echo ${file/#\/dir/\/DIR} #替换全部  .   及其右边的字符串 #/dir1/dir2/dir3/my
echo '${file/%txt/TXT} : ----------------------'
echo ${file/%txt/TXT} #替换全部  .   及其右边的字符串 #/dir1/dir2/dir3/my

