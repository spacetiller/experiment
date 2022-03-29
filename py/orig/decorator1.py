# !/usr/bin/python
# -*- coding:utf8 -*-

def makebold(fn):
    def warp():
        return "<a>"+fn()+"<a>"
    return warp
def makeitalic(fn):
    def warp():
        return "<b>"+fn()+"<b>"
    return warp
@makebold         #这句话相当于makebold(test1),也就是把当前函数传过去
def test1():
    return "test1"
 
@makeitalic
def test2():
    return "test2"
    
@makebold
@makeitalic
def test3():     #函数和装饰器是倒着执行的，从下往上
    return "test3"
    
print(test1())
print(test2())
print(test3())
