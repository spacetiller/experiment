# https://docs.python.org/3.4/library/asyncio-task.html
# before python 3.5
import asyncio

@asyncio.coroutine
# DeprecationWarning: "@coroutine" decorator is deprecated since Python 3.8, use "async def" instead
def compute(x, y):
    print("Compute %s + %s ..." % (x, y))
    yield from asyncio.sleep(1.0)
    return x + y

@asyncio.coroutine
# async def print_sum(x, y):
# SyntaxError: 'yield from' inside async function
def print_sum(x, y):
    result = yield from compute(x, y)
    print("%s + %s = %s" % (x, y, result))

loop = asyncio.get_event_loop()
loop.run_until_complete(print_sum(1, 2))
loop.close()

