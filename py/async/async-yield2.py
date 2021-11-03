import asyncio
import types

@types.coroutine
def compute(x, y):
    print("Compute %s + %s ..." % (x, y))
    yield from asyncio.sleep(1.0)
    return x + y

async def print_sum(x, y):
    result = await compute(x, y)
    print("%s + %s = %s" % (x, y, result))

loop = asyncio.get_event_loop()
loop.run_until_complete(print_sum(1, 2))
loop.close()

# 尽管两个函数分别使用了新旧语法，但他们都是协程对象，也分别称作native coroutine以及generator-based coroutine，因此不用担心语法问题。

