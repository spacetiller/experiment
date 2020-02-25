# -*- coding: utf-8 -*-

from amqplib import client_0_8 as amqp
import sys
import datetime


conn = amqp.Connection(host="localhost:5672", userid="guest", password="guest", virtual_host="/", insist=True)
chan = conn.channel()

time = sys.argv[1]
now_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
count = 1
while now_time < sys.argv[1]:
	now_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
	msg = amqp.Message(str(count))
	msg.properties["delivery_mode"] = 2
	try:
		chan.basic_publish(msg,exchange="sorting_room",routing_key="jason")
		count += 1
	except:
		conn = amqp.Connection(host="xx.xx.xx.43:5672", userid="guest", password="guest", virtual_host="/", insist=False)
		chan = conn.channel()
		chan.basic_publish(msg,exchange="sorting_room",routing_key="jason")
		count += 1
	print >> open("43.txt","a+"), count
	print(count)
print('end')

try:
	chan.close()
	conn.close()
except Exceptions as msg:
	log.msg("rabbitmq connect has a error: %s"% msg, level=log.ERROR)

