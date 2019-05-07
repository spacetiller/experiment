#!/usr/bin/env python
#-*- coding:utf-8 -*-
import tensorflow as tf

tensor = tf.constant('Hellow Tensorflow!')
with tf.Session() as sess: # use python with scope
    print(sess.run(tensor))
