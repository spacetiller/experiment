#!/usr/bin/env python
# -*- coding:utf-8 -*-
import redis
import RedisCache

r = redis.Redis(host='127.0.0.1', port=6379,db=11)
r.set('name', 'zhangsan')   #添加
print (r.get('name'))   #获取




pool = redis.ConnectionPool(host='127.0.0.1', port=6379, db=11)
r = redis.Redis(connection_pool=pool)

pipe = r.pipeline(transaction=True)

r.set('name', 'zhangsan')
r.set('name', 'lisi')
r.hmset('name2', {'k1':'v1', 'k2': 'v2'})
print (r.get('name'))   #获取

pipe.execute()


rc = RedisCache.RedisCache()
rc.set_data('name', "Silvia")
print (rc.get_data('name'))