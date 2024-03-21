#!/usr/bin/env python
import pika

credentials = pika.PlainCredentials('admin', 'icss#202212')
parameters = pika.ConnectionParameters('192.168.0.19', credentials=credentials)
connection = pika.BlockingConnection(parameters)

channel = connection.channel()

channel.queue_declare(queue='zhanghui')

channel.basic_publish(exchange='', routing_key='zhanghui', body='Hello World!')
print(" [x] Sent 'Hello World!'")
connection.close()
