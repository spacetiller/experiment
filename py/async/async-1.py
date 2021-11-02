import asyncio
import time
from threading import Thread

class myThread (Thread):
    async def visit_url(self, url, response_time):
        """访问 url"""
        await asyncio.sleep(response_time)
        print(f"访问{url}, 已得到返回结果")
    
    async def run_task(self):
        print('start')
        task = self.visit_url('http://wangzhen.com', 2)
        task_2 = self.visit_url('http://another', 3)
        await asyncio.create_task(task)
        await asyncio.create_task(task_2)
        # await task
        # await task_2
        # th = Thread(asyncio.run(task))
        # th.run()
        print('end')

    def run(self):
        asyncio.run(self.run_task())

start_time = time.perf_counter()
# asyncio.run(run_task())
# th = Thread(target=asyncio.run(run_task()),daemon=True)
# th.run()
# print(th.isDaemon())
mt = myThread()
mt.start()
print(f"消耗时间：{time.perf_counter() - start_time}")

