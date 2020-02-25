# -*- coding=utf-8 -*-
# __author = 'zhanghui'__

from kafka import KafkaConsumer
from kafka.structs import TopicPartition

consumer = KafkaConsumer('bi_marketing', auto_offset_reset='earliest', bootstrap_servers=['10.110.28.13:9092'])
#consumer = KafkaConsumer('bi_marketing_stg',bootstrap_servers=['10.11.32.91:30001'])

print(consumer.partitions_for_topic("bi_marketing"))  #获取test主题的分区信息
print(consumer.topics())  #获取主题列表
print(consumer.subscription())  #获取当前消费者订阅的主题
print(consumer.assignment())  #获取当前消费者topic、分区信息
print(consumer.beginning_offsets(consumer.assignment())) #获取当前消费者可消费的偏移量
consumer.seek(TopicPartition(topic=u'bi_marketing', partition=0), 5)  #重置偏移量，从第5个偏移量消费

for message in consumer:
    print ("%s:%d:%d: key=%s value=%s" % (message.topic, message.partition,
                                          message.offset, message.key,
                                          message.value))

