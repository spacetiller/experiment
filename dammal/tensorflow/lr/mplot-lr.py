#!/usr/bin/env python
#-*- coding:utf-8 -*-
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

my_data = np.genfromtxt('data.txt', delimiter='\t', dtype=float)
x_data = np.array(my_data[:,1])
y_data = np.array(my_data[:,2])

#print(x_data)
#print(y_data)

#w = tf.Variable(np.random.randn(), name="W")
#b = tf.Variable(np.random.randn(), name="bias")

weights = tf.Variable(tf.random_uniform([1], -1.0, 1.0))
biases = tf.Variable(tf.zeros([1]))

print weights,biases

y = weights*x_data + biases

loss = tf.reduce_mean(tf.square(y-y_data))

optimizer = tf.train.GradientDescentOptimizer(0.5)

train = optimizer.minimize(loss)

init = tf.global_variables_initializer() 

sess = tf.Session()
sess.run(init)         

for step in range(300):
    sess.run(train)
    if step % 20 == 0:
        print(step, 'weight: ',sess.run(weights), ' bias: ', sess.run(biases))

plt.plot(x_data, y_data, "ro", label="Origina data")  #ro 表示用红色red的圆圈表示
plt.plot(x_data, sess.run(tf.add(tf.multiply(weights, x_data), biases)), label="fitting line")
plt.legend ()
plt.show ()
sess.close()
