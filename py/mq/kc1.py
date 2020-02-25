# -*- coding=utf-8 -*-
# __author = 'zhanghui'__

from kafka import KafkaConsumer

#consumer = KafkaConsumer('bi_marketing',bootstrap_servers=['10.110.28.13:9092'])
consumer = KafkaConsumer('bi_marketing_ads_job_status',
						auto_offset_reset='earliest',
						bootstrap_servers=['10.11.32.91:30001'])
                         
for message in consumer:
    print ("%s:%d:%d: key=%s value=%s" % (message.topic, message.partition,
                                          message.offset, message.key,
                                          message.value))

