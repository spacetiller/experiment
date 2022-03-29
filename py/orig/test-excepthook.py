"""
1.对于一个未匹配到的例外，python解释器最后会调用sys.excepthook()并传入3个自变量：例外类型、例外实例
  和traceback对象，也就是sys.exc_info()返回元组中的3个值。默认显示相关例外的追踪信息。
2.如果想自定义sys.excepthook()被调用时的行为，可以自定义一个接受3个自变量的函数给sys.excepthook。
"""
 
 
import time,sys
def m():
    return 1 / 0
 
def n():
    m()
 
def p():
    n()
 
def myExcepthook(ttype,tvalue,ttraceback):
    print("例外类型：{}".format(ttype))
    print("例外对象：{}".format(tvalue))
    i = 1
    while ttraceback:
        print("第{}层堆栈信息".format(i))
        tracebackCode = ttraceback.tb_frame.f_code
        print("文件名：{}".format(tracebackCode.co_filename))
        print("函数或者模块名：{}".format(tracebackCode.co_name))
        ttraceback = ttraceback.tb_next
        i += 1
 
 
if __name__ == '__main__':
    sys.excepthook = myExcepthook
    p()
 
    time.sleep(3)
    print("继续执行")

