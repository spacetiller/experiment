#!/usr/bin/env python
#-*- coding:utf-8 -*-

'''
全连接神经网络结构：
Input-->(w*x+b)-->ReLu激活函数-->DropOut层-->(w*x+b)-->softmax层-->Output
创建默认的InteractiveSession，这里我把这个网络结构划分出来
'''
from tensorflow.examples.tutorials.mnist import input_data
import tensorflow as tf

#载入mnist数据集
mnist=input_data.read_data_sets('MNIST_data/',one_hot=True)
print(mnist[:10])
sess=tf.InteractiveSession()

'''神经网络第一步：定义算法公式(神经网络Forward)

注意,这里tf.truncated_normal([in_units,h1_units],stddev=0.1)为截断的高斯分布（正态分布），这里标准差（stdd）为0.1，因为我们使用的是上面讲述的ReLU作为激活函数（activation function），所以我们需要给函数加点噪声提高泛化性。keep_prob为后面的dropout的参数，表示留下参数的比例

'''
in_units=784
h1_units=300
w1=tf.Variable(tf.truncated_normal([in_units,h1_units],stddev=0.1))#截断的高斯分布/正态分布
b1=tf.Variable(tf.zeros([h1_units]))
w2=tf.Variable(tf.zeros([h1_units,10]))
b2=tf.Variable(tf.zeros([10]))

x=tf.placeholder(tf.float32,[None,in_units])
keep_prob=tf.placeholder(tf.float32)

'''
前向传播算法
这里我们使用ReLU激活函数，并进行Dropout降采样。
'''
hidden1=tf.nn.relu(tf.matmul(x,w1)+b1)
hidden1_drop=tf.nn.dropout(hidden1,keep_prob)
y=tf.nn.softmax(tf.matmul(hidden1_drop,w2)+b2)

'''
定义损失函数 
这里我们计算它的交叉熵（cross entropy），并取平均值，注意熵的定义公式为：H=-sum(p*log(p)),然后以学习率η=0.3
'''
'''神经网络第二步：定义损失函数和选择优化器来优化loss（损失)'''
y_=tf.placeholder(tf.float32,[None,10])
cross_entropy=tf.reduce_mean(-tf.reduce_sum(y_*tf.log(y),reduction_indices=[1]))
train_step=tf.train.AdagradOptimizer(0.3).minimize(cross_entropy)

'''
神经网络第三步：训练步骤
开始训练 
训练轮数为3000，batch大小为100
'''
tf.global_variables_initializer().run()
for i in range(3000):
    batch_xs,batch_ys=mnist.train.next_batch(100)
    train_step.run(feed_dict={x:batch_xs,y_:batch_ys,keep_prob:0.75})

'''
神经网络第四步：对模型进行准确率评测
准确率测试 
注意这里的keep_prob要设置为1.0，也就是要测试全部的样本，一般情况下在测试阶段不适用dropout，只在训练阶段进行dropout稀疏化。
'''
correct_prediction=tf.equal(tf.argmax(y,1),tf.argmax(y_,1))
accuarcy=tf.reduce_mean(tf.cast(correct_prediction,tf.float32))
print(accuarcy.eval(feed_dict={x:mnist.test.images,y_:mnist.test.labels,keep_prob:1.0}))






