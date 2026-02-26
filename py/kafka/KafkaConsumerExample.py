import threading
import time
import random

def integrated_demo():
    """完整的生产消费演示"""
    
    def run_producer():
        """生产者线程"""
        producer = KafkaProducerExample(['localhost:9092'])
        
        actions = ['login', 'logout', 'purchase', 'view', 'search']
        
        for i in range(10):
            message = {
                "user_id": random.randint(1, 100),
                "action": random.choice(actions),
                "timestamp": int(time.time()),
                "message_id": i
            }
            
            if message['action'] == 'purchase':
                message['amount'] = round(random.uniform(10, 1000), 2)
            
            producer.send_message('user_events', message, key=message['user_id'])
            time.sleep(0.5)
        
        producer.close()
        print("生产者完成")
    
    def run_consumer():
        """消费者线程"""
        # 等待生产者开始发送消息
        time.sleep(2)
        
        consumer = KafkaConsumerExample(
            bootstrap_servers=['localhost:9092'],
            topics=['user_events'],
            group_id='demo_group'
        )
        
        # 消费5秒钟
        start_time = time.time()
        while time.time() - start_time < 10:
            message_batch = consumer.consumer.poll(timeout_ms=1000)
            for topic_partition, messages in message_batch.items():
                for message in messages:
                    consumer.process_message(message)
                    consumer.consumer.commit()
        
        consumer.close()
        print("消费者完成")
    
    # 启动生产者和消费者线程
    producer_thread = threading.Thread(target=run_producer)
    consumer_thread = threading.Thread(target=run_consumer)
    
    producer_thread.start()
    consumer_thread.start()
    
    producer_thread.join()
    consumer_thread.join()
    
    print("演示完成")

if __name__ == "__main__":
    # 运行单个示例
    # producer_demo()
    # consumer_demo()
    
    # 或者运行完整演示
    integrated_demo()