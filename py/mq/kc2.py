# -*- coding=utf-8 -*-
# __author = 'zhanghui'__
import time
import six
from kafka import KafkaConsumer

consumer = KafkaConsumer(bootstrap_servers=['10.110.28.13:9092']
			#,auto_offset_reset='earliest'
			#,value_deserializer=json.loads
			#,api_version=(1,1,0)
			)
#consumer = KafkaConsumer('bi_marketing_stg',bootstrap_servers=['10.11.32.91:30001'])
                         
#for message in consumer:
consumer.subscribe(topics=('bi_marketing'))
while True:
	#for msg in consumer:
	msgs = consumer.poll(timeout_ms=5)   #从kafka获取消息
	#print(len(msgs))
	for p, ms in six.iteritems(msgs):
		print(len(ms))
		for m in ms:
			print(m)
            
	#while True:
	#	msg = next(consumer,None)   #从kafka获取消息
	#	if not msg:
	#		break
	#	print(str(msg))
	#print(str(msg.value))
	#for i in msgs:
#		print(str(i))
		#print(i.values)
		#for k in i:
		#	print(str(k))
		#	print(k.value)
#			print(k.offset, k.value)
		#print(m.partition())
		#print(m.value())
		#print(msg["TopicPartition(topic='bi_marketing', partition=0)"])
	#print ("%s:%d:%d: key=%s value=%s" % (msg.topic, msg.partition,msg.offset, msg.key,msg.value))
	time.sleep(10)
