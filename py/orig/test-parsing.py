#coding: utf8
from pyparsing import Word, nums, Combine, alphas, Literal, ZeroOrMore, Group, Suppress

greet = Word( alphas ) + "," + Word( alphas ) + "!"
greeting = greet.parseString( "Hello, World!" )
print(greeting)

text='1+2=3'
integer = Word(nums)  # simple unsigned integer
try:
    result1 = integer.parseString(text)
    print( result1 )
    for tokens, start,end in integer.scanString(text):
        print( tokens, start, end )
except ParseException as pe:
    print("  No match: {0}".format(str(pe)))
