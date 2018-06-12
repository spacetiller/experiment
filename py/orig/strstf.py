#!/usr/bin/python
# filename: strstf.py

import string

name = 'Swaroop' # This is a string object 

if name.startswith('Swa'):
    print 'Yes, the string starts with "Swa"'

if 'a' in name:
    print 'Yes, it contains the string "a"'

if name.find('war') != -1:
    print 'Yes, it contains the string "war"'

delimiter = '_*_'
mylist = ['Brazil', 'Russia', 'India', 'China']
print delimiter.join(mylist)

print string.ascii_lowercase;

whole = 'hello this is a string, bye'
print string.capwords(whole,'-') 
print (string.split(whole))[0]
