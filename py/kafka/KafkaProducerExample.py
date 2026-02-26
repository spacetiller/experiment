from kafka import KafkaProducer
from kafka.errors import KafkaError
import json
import time
import logging

# 配置日志
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class KafkaProducerExample:
    def __init__(self, bootstrap_servers):
        self.producer = KafkaProducer(
            bootstrap_servers=bootstrap_servers,
            value_serializer=lambda v: json.dumps(v).encode('utf-8'),
            key_serializer=lambda k: str(k).encode('utf-8') if k else None,
            # 生产配置
            acks='all',  # 确保消息被所有副本确认
            retries=3,   # 重试次数
            batch_size=16384,  # 批量大小
            linger_ms=10,  # 等待时间
            buffer_memory=33554432  # 缓冲区大小
        )
        logger.info(f"Producer初始化完成，连接至: {bootstrap_servers}")
    
    def send_message(self, topic, value, key=None, partition=None):
        """
        发送消息到Kafka
        
        Args:
            topic: 主题名称
            value: 消息内容
            key: 消息键（可选）
            partition: 分区（可选）
        """
        try:
            future = self.producer.send(
                topic=topic,
                value=value,
                key=key,
                partition=partition
            )
            
            # 等待发送确认
            record_metadata = future.get(timeout=10)
            
            logger.info(f"消息发送成功 -> "
                       f"主题: {record_metadata.topic}, "
                       f"分区: {record_metadata.partition}, "
                       f"偏移量: {record_metadata.offset}")
            
            return True
            
        except KafkaError as e:
            logger.error(f"消息发送失败: {e}")
            return False
    
    def send_message_async(self, topic, value, key=None, callback=None):
        """
        异步发送消息
        """
        def default_callback(record_metadata):
            logger.info(f"异步发送成功 -> "
                       f"主题: {record_metadata.topic}, "
                       f"分区: {record_metadata.partition}, "
                       f"偏移量: {record_metadata.offset}")
        
        future = self.producer.send(
            topic=topic,
            value=value,
            key=key
        )
        
        future.add_callback(callback or default_callback)
        future.add_errback(lambda e: logger.error(f"异步发送失败: {e}"))
    
    def flush(self):
        """确保所有消息都被发送"""
        self.producer.flush()
        logger.info("所有消息已刷新到Kafka")
    
    def close(self):
        """关闭生产者"""
        self.producer.close()
        logger.info("Producer已关闭")

# 使用示例
def producer_demo():
    producer = KafkaProducerExample(['localhost:9092'])
    
    # 发送同步消息
    messages = [
        {"user_id": 1, "action": "login", "timestamp": int(time.time())},
        {"user_id": 2, "action": "purchase", "amount": 100.50},
        {"user_id": 3, "action": "logout", "timestamp": int(time.time())}
    ]
    
    for i, message in enumerate(messages):
        success = producer.send_message(
            topic='user_events',
            value=message,
            key=message['user_id']  # 使用user_id作为key，确保相同用户的消息到同一分区
        )
        
        if success:
            print(f"消息 {i+1} 发送成功")
        
        time.sleep(1)  # 模拟间隔
    
    # 发送异步消息
    async_message = {"user_id": 4, "action": "view", "item_id": "product_123"}
    producer.send_message_async('user_events', async_message)
    
    # 确保所有消息发送完成
    producer.flush()
    producer.close()

if __name__ == "__main__":
    producer_demo()