import requests
import time
import asyncio

# 创建一个异步函数
async def task_func():
    await asyncio.sleep(1)
    resp = requests.get('http://192.168.2.177:5002/')
    print('2222222',time.time(),resp.text)


async def main(loop):
    loop=asyncio.get_event_loop()   # 获取全局轮训器
    task = loop.create_task(task_func())  # 在全局轮训器加入协成，只有加入全局轮训器才能被监督执行
    await asyncio.sleep(2)   # 等待两秒为了不要立即执行event_loop.close()，项目中event_loop应该是永不停歇的
    print('11111111111',time.time())


event_loop = asyncio.get_event_loop()
try:
    event_loop.run_until_complete(main(event_loop))
finally:
    event_loop.close()    # 当轮训器关闭以后，所有没有执行完成的协成将全部关闭

