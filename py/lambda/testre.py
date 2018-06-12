
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
˵����
[^\._-][\w\.-]+@(?:[A-Za-z0-9]+\.)+[A-Za-z]+$ƥ�����䡣
�ۺ�Ŀǰ���ڳ��õ����䣬���ͨ�õĹ��������
1��[^\._]���������»��ߺ;�㿪ͷ��
2��[\w\.]+��������ĸ�����֡����Ծ�㼰�»��߸��ṩ���в�𣬶Դ���Ч�Բ������ϸ���жϡ�
3��@�Ǳ���ġ�
4��(?:[A-Za-z0-9]+\.)+[A-Za-z]+$��@����xxx.xxx��β�����ǵ��༶�����������������xxx.xxx.xxx��xxx@yahoo.com.cn

^0\d{2,3}\d{7,8}$|^1[358]\d{9}$|^147\d{8}$ƥ��绰���롣
ֻ���ǹ��ڵ����,���ͨ�õĹ��������
1��^0\d{2,3}���̶��绰����3-4λ���֣���0��ͷ��
2��d{7,8}$���̶��绰һ��7-8λ���֡�
3������Ŀǰ���ֻ����붼��11λ���֣�������Ӫ�̵ĺ���λ������������г����ˣ������������147�ĺ���ĶΣ������Ķ�ֻ����ǰ��λ��
����λ�Ͳ������ˣ����򣬹�����Ҳ�ܴ�ǰ��λ����13*��15*��18*��

'''
p=re.compile('[^\._-][\w\.-]+@(?:[A-Za-z0-9]+\.)+[A-Za-z]+$|^0\d{2,3}\d{7,8}$|^1[358]\d{9}$|^147\d{8}')

match = p.match(inputmail)

if match:
    print match.group()
else:
    print 'mail address or phone number is error!'