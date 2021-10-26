import asyncio
import random
import aiohttp
import _thread

async def producer(queue):
    for i in range(3):
        #sleep_time = random.randint(1, 2)
        #await queue.put(sleep_time)
        await queue.put(i)
        await asyncio.sleep(random.randint(1,3))

async def consumer(queue):
    while True:
        size = queue.qsize()
        print(f'当前队列有：{size} 个元素')
        sleep_time = await queue.get()
        size = queue.qsize()
        print(f'然后队列有：{size} 个元素，当前取出：{sleep_time}')
        url = f'http://httpbin.org/delay/2'
        #url = f'http://httpbin.org/delay/{sleep_time}'
        #async with aiohttp.ClientSession() as client:
        #    resp = await client.get(url)
        #    print(await resp.json())

async def main():
    queue = asyncio.Queue(maxsize=3)
    asyncio.create_task(producer(queue))
    con = asyncio.create_task(consumer(queue))
    await con


print("start")
ptr = _thread.start_new_thread(asyncio.run(main()), ())
print(ptr)
print("end")

#https://cloud.tencent.com/developer/article/1638916
