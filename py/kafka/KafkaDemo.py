from kafka import KafkaConsumer
from kafka.errors import KafkaError
import json
import logging
import signal
import sys

# 配置日志
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class KafkaConsumerExample:
    def __init__(self, bootstrap_servers, topics, group_id):
        # 确保topics是列表
        if isinstance(topics, str):
            topics = [topics]
        
        self.consumer = KafkaConsumer(
            *topics,  # 解包主题列表
            bootstrap_servers=bootstrap_servers,
            group_id=group_id,
            auto_offset_reset='earliest',  # 从最早的消息开始消费
            enable_auto_commit=False,  # 手动提交偏移量
            value_deserializer=lambda x: json.loads(x.decode('utf-8')) if x else None,
            key_deserializer=lambda x: x.decode('utf-8') if x else None,
            # 消费者配置
            session_timeout_ms=30000,
            heartbeat_interval_ms=10000,
            max_poll_records=100,  # 每次poll最大记录数
            fetch_max_wait_ms=500,
            fetch_min_bytes=1
        )
        
        self.running = True
        self.setup_signal_handlers()
        
        logger.info(f"Consumer初始化完成 -> "
                   f"主题: {topics}, "
                   f"消费者组: {group_id}")
    
    def setup_signal_handlers(self):
        """设置信号处理器，用于优雅关闭"""
        def signal_handler(sig, frame):
            logger.info("收到关闭信号，正在优雅关闭...")
            self.running = False
        
        signal.signal(signal.SIGINT, signal_handler)
        signal.signal(signal.SIGTERM, signal_handler)
    
    def process_message(self, message):
        """
        处理消息的业务逻辑
        根据实际需求重写此方法
        """
        try:
            logger.info(f"""
📨 收到消息:
    主题: {message.topic}
    分区: {message.partition}
    偏移量: {message.offset}
    键: {message.key}
    值: {message.value}
    时间戳: {message.timestamp}
            """)
            
            # 模拟业务处理
            if message.value and 'action' in message.value:
                action = message.value['action']
                if action == 'purchase':
                    self.handle_purchase(message.value)
                elif action == 'login':
                    self.handle_login(message.value)
            
            return True
            
        except Exception as e:
            logger.error(f"处理消息时发生错误: {e}")
            return False
    
    def handle_purchase(self, data):
        """处理购买事件"""
        logger.info(f"💳 处理购买事件: 用户 {data.get('user_id')} 购买金额 {data.get('amount')}")
        # 实际业务逻辑...
    
    def handle_login(self, data):
        """处理登录事件"""
        logger.info(f"🔐 处理登录事件: 用户 {data.get('user_id')} 登录")
        # 实际业务逻辑...
    
    def consume_messages(self):
        """开始消费消息"""
        logger.info("开始消费消息...")
        
        try:
            while self.running:
                # 拉取消息，超时时间1秒
                message_batch = self.consumer.poll(timeout_ms=1000, max_records=10)
                
                for topic_partition, messages in message_batch.items():
                    logger.info(f"从 {topic_partition} 收到 {len(messages)} 条消息")
                    
                    for message in messages:
                        # 处理消息
                        success = self.process_message(message)
                        
                        if success:
                            # 处理成功，提交偏移量
                            self.consumer.commit()
                        else:
                            logger.warning(f"消息处理失败，跳过提交: {message.offset}")
                
                # 如果没有消息，短暂休眠
                if not message_batch:
                    time.sleep(0.1)
                    
        except KafkaError as e:
            logger.error(f"Kafka错误: {e}")
        except Exception as e:
            logger.error(f"消费消息时发生未知错误: {e}")
        finally:
            self.close()
    
    def seek_to_beginning(self):
        """重置到分区开始位置"""
        self.consumer.seek_to_beginning()
        logger.info("已重置到分区开始位置")
    
    def get_assigned_partitions(self):
        """获取分配的分区"""
        return self.consumer.assignment()
    
    def close(self):
        """关闭消费者"""
        self.consumer.close()
        logger.info("Consumer已关闭")

# 使用示例
def consumer_demo():
    consumer = KafkaConsumerExample(
        bootstrap_servers=['localhost:9092'],
        topics=['user_events'],  # 可以是单个主题或列表
        group_id='user_events_consumer_group'
    )
    
    # 显示分配的分区
    partitions = consumer.get_assigned_partitions()
    logger.info(f"分配的分区: {partitions}")
    
    # 开始消费
    consumer.consume_messages()

if __name__ == "__main__":
    consumer_demo()