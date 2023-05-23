import numpy as np
import tensorflow.compat.v1 as tf
tf.disable_v2_behavior()
coefficients = np.array([[1], [-10], [25]])
w = tf.Variable([0], dtype=tf.float32)
x = tf.placeholder(tf.float32, [3, 1])
cost = x[0][0] * w ** 2 + x[1][0] * w + x[2][0]
train = tf.train.GradientDescentOptimizer(0.01).minimize(cost)
init = tf.global_variables_initializer()
session = tf. Session()
session.run(init)
print(session.run(w))
for i in range(1000):
    session.run(train, feed_dict={x:coefficients})  # 将数值向量coefficients填充到我们的占位符x中
print(session.run(w))

