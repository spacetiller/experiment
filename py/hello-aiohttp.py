#!/usr/bin/env python3
import argparse
from aiohttp import web
import asyncio
import base64
import logging
import uvloop
import time,datetime
import json
import requests

asyncio.set_event_loop_policy(uvloop.EventLoopPolicy())


routes = web.RouteTableDef()


@routes.get('/')
async def hello(request):
    return web.Response(text="Hello, world")


# 定义一个路由映射，接收网址参数，post方式
@routes.post('/demo1/{name}')
async def demo1(request):   # 异步监听，只要一有握手就开始触发，此时网址参数中的name就已经知道了，但是前端可能还没有完全post完数据。
    name = request.match_info.get('name', "Anonymous")  # 获取name
    print(datetime.datetime.now())   # 触发视图函数的时间
    data = await request.post()    # 等待post数据完成接收，只有接收完成才能进行后续操作.data['key']获取参数
    print(datetime.datetime.now())   # 接收post数据完成的时间
    logging.info('safety dect request start %s' % datetime.datetime.now())
    result = {'name':name,'key':data['key']}
    logging.info('safety dect request finish %s, %s' % (datetime.datetime.now(),json.dumps(result)))
    return web.json_response(result)


# 定义一个路由映射，设计到io操作
@routes.post('/demo2')
async def demo2(request):   # 异步监听，只要一有握手就开始触发，此时网址参数中的name就已经知道了，但是前端可能还没有完全post完数据。
    data = await request.post()    # 等待post数据完成接收，只有接收完成才能进行后续操作.data['key']获取参数
    logging.info('safety dect request start %s' % datetime.datetime.now())
    res = requests.post('http://www.baidu.com')   # 网路id，会自动切换到其他协成上
    logging.info('safety dect request finish %s' % res.test)
    return web.Response(text="welcome")




if __name__ == '__main__':

    logging.info('server start')
    app = web.Application()
    app.add_routes(routes)
    web.run_app(app,host='0.0.0.0',port=8080)
    logging.info('server close')

