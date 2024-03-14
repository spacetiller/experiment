import numpy as np
import tensorflow as tf
 
# 定义一个类型为float32的tensorflow变量w
w = tf.Variable(0, dtype=tf.float32)
 
# 定义成本函数cost
# cost = tf.add(tf.add(w ** 2, tf.multiply(-10., w)), 25)
cost = w ** 2 - 10 * w + 25
 
# 定义梯度下降实例对象，learning rate = 0.01，并最小化cost
tf.compat.v1.disable_eager_execution()
optimizer = tf.compat.v1.train.GradientDescentOptimizer(0.01)
train = optimizer.minimize(cost)
       
# 创建一个tensorflow的session对象
init = tf.compat.v1.global_variables_initializer()
 
with tf.compat.v1.Session() as sess:
    sess.run(init)     # 用session.run(w)获取w的当前值(初始值)
    print(sess.run(w))
    # sess.run(train)     # 执行一次梯度下降后的w
    # print(sess.run(w))
    for i in range(1000):
        sess.run(train)
    print(sess.run(w))   # 执行1000次梯度下降后的w



