from memory_profiler import profile

@profile
#@profile(precision=4) 指定小数位.
def my_func():
    a = [1] * (10 ** 6)
    b = [2] * (2 * 10 ** 7)
    del b
    return a

if __name__ == '__main__':
    my_func()

