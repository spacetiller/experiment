
#!/usr/bin/env python
#-*- coding:utf-8 -*-
import re
import sys

def getIPAddFromFile(fobj):
regex
= re.compile(r'\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b',
 re.IGNORECASE)
ipadds
= re.findall(regex,
 fobj)
print
 ipadds
return
 ipadds

def getPhoneNumFromFile(fobj):
regex
= re.compile(r'1\d{10}',
 re.IGNORECASE)
phonenums
= re.findall(regex,
 fobj)
print
 phonenums
return
 phonenums

def getMailAddFromFile(fobj):
regex
= re.compile(r"\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b",
 re.IGNORECASE)
mails
= re.findall(regex,
 fobj)
print
 mails
return
 mails

def getUrlFromFile(fobj):
	regex
	= re.compile(r"http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*,]|(?:%[0-9a-fA-F][0-9a-fA-F]))+",
	 re.IGNORECASE)
	urls
	= regex.findall(fobj)
	print
	 urls
	return
	 urls

def main(FilefilePath):
	fobj
	= open(FilefilePath,
	'rb').read()
	urllist
	= getUrlFromFile(fobj)
	mailList
	= getMailAddFromFile(fobj)
	phoneNum
	= getPhoneNumFromFile(fobj)
	ipaddlist
	= getIPAddFromFile(fobj)

if __name__=='__main__':
	main(sys.argv[1])
	
	
	

print 'Please input mail address:',
inputmail=raw_input()

'''
说明：
[^\._-][\w\.-]+@(?:[A-Za-z0-9]+\.)+[A-Za-z]+$匹配邮箱。
综合目前国内常用的邮箱，大概通用的规则包括：
1、[^\._]，不能以下划线和句点开头。
2、[\w\.]+，包括字母、数字。而对句点及下划线各提供商有差别，对此有效性不做更严格的判断。
3、@是必须的。
4、(?:[A-Za-z0-9]+\.)+[A-Za-z]+$，@后以xxx.xxx结尾，考虑到多级域名，会有这种情况xxx.xxx.xxx如xxx@yahoo.com.cn

^0\d{2,3}\d{7,8}$|^1[358]\d{9}$|^147\d{8}$匹配电话号码。
只考虑国内的情况,大概通用的规则包括：
1、^0\d{2,3}，固定电话区号3-4位数字，以0开头。
2、d{7,8}$，固定电话一般7-8位数字。
3、国内目前的手机号码都是11位数字，三大运营商的号码段基本都在上面列出来了，我们这里除了147的号码的段，其他的都只考虑前两位，
第三位就不考虑了，否则，工作量也很大。前两位包括13*、15*、18*。

'''
p=re.compile('[^\._-][\w\.-]+@(?:[A-Za-z0-9]+\.)+[A-Za-z]+$|^0\d{2,3}\d{7,8}$|^1[358]\d{9}$|^147\d{8}')

match = p.match(inputmail)

if match:
    print match.group()
else:
    print 'mail address or phone number is error!'