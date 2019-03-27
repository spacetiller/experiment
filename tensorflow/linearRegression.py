#!/usr/bin/env python
#-*- coding:utf-8 -*-
import tensorflow as tf
import numpy as np

my_data = np.genfromtxt('data.txt', delimiter='\t', dtype=float)
x_data = np.array(my_data[:,1])
y_data = np.array(my_data[:,2])

#print(x_data)
#print(y_data)

#w = tf.Variable(np.random.randn(), name="W")
#b = tf.Variable(np.random.randn(), name="bias")

weights = tf.Variable(tf.random_uniform([1], -1,0, 1.0))
biases = tf.Variable(tf.zeros([1]))

print weights,biases

y = weights*x_data + biases

loss = tf.reduce_mean(tf.square(y-y_data))

optimizer = tf.train.GradientDescentOptimizer(0.5)

train = optimizer.minimize(loss)

init = tf.global_variables_initializer() 

sess = tf.Session()
sess.run(init)         

for step in range(2001):
    sess.run(train)
    if step % 20 == 0:
        print(step, 'weight: ',sess.run(weights), ' bias: ', sess.run(biases))
sess.close()

