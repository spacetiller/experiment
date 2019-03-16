#!/usr/bin/python
# -*- encoding: utf-8 -*-

from __future__ import division, print_function, absolute_import
import sys

if sys.getdefaultencoding() != 'gbk': 
    reload(sys) 
    sys.setdefaultencoding('gbk')

TEST_ITEM = 'A'

# ------------------------------- ��С���˷� Minimum Least Square -------------------------------

'''
��С���˷��� 1805 ���� Adrien-Marie Legendre �״������1805, Legendre������λ������ѧ��Ҳ�Բ������������������������Ԥ�����ǵķ�λ����ֲ�и��Ѱ��һ�ֿ��Ի������Ƿ�λ��ʷ���ݼ�����켣���㷨��
��������������㷨��һ����Դ������ҵ���һ���㷨���������Legendre ���㷨������Ԥ������δ���ķ�λ��Ȼ���������ƽ��������Ŀ����ͨ���޸�Ԥ��ֵ�Լ������ƽ���͡�����Ҳ�������Իع�Ļ���˼�롣
���߿����� Jupyter notebook �������������������������㷨����⡣m ��ϵ����b ��Ԥ��ĳ����coordinates �����ǵ�λ�á�Ŀ�����ҵ����ʵ� m �� b ʹ��������С��
'''

# ͼƬ�� http://mmbiz.qpic.cn/mmbiz_png/fhujzoQe7TqFYn0Uhvru5peBqHAyThLEliavGaHh30Bwu61mAVCQDmkpwkJZsQQN356ufAdn0C5eE5JiaxF07UYQ/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1

# y = mx + b
# m is slope, b is y-intercept
 
def compute_error_for_line_given_points(b, m, coordinates):
    totalError = 0
    for i in range(0, len(coordinates)):
        x = coordinates[i][0]
        y = coordinates[i][1]
        totalError += (y - (m * x + b)) ** 2
    return totalError / float(len(coordinates))

# example
compute_error_for_line_given_points(1, 2, [[3,6],[6,9],[12,18]])


# ------------------------------- �ݶ��½��� Gradient Descent -------------------------------

'''
Legendre ����ͨ���ֶ����������ʹ����ʵķ����ǳ���ʱ��������ŵ���������� Peter Debye ��һ�����ͺ�1909 �꣩��ʽ�����һ�ּ�������̵ķ�����
���� Legendre ���㷨��Ҫ����һ������ ���� ���ǳ�֮Ϊ X ��Y ���ʾÿ�� X �����ֵ��Legendre ���㷨���ҵ�ʹ�������С�� X������ͼ�У����ǿ��Կ����� X = 1.1 ʱ����� Y ȡ����Сֵ��
# ͼƬ�� http://mmbiz.qpic.cn/mmbiz_png/fhujzoQe7TqFYn0Uhvru5peBqHAyThLEujNQzDLOxgayBHIBS1ibm2bddTVmR913MPibHpfsQUliaAibZia6ia9zoW8A/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1
Peter Debye ע�⵽��͵���ߵ�б���Ǹ��ģ�����һ���������ġ���ˣ����֪����������� X ��б��ֵ���Ϳ����ҵ� Y ����Сֵ�㡣
������ݶ��½��㷨�Ļ���˼�롣�������е����ѧϰģ�Ͷ����õ��ݶ��½��㷨��
Ҫʵ������㷨�����Ǽ��������� Error = x ^ 5 -2x ^ 3-2��Ҫ�õ�������� X ��б�ʣ�������Ҫ�����󵼣��� 5x^4 �C 6x^2��
�������Ҫ��ϰ���������֪ʶ����ۿ� Khan Academy ����Ƶ��
���������� Python ʵ�� Debye ���㷨��
'''

current_x = 0.5 # the algorithm starts at x=0.5
learning_rate = 0.01 # step size multiplier
num_iterations = 60 # the number of times to train the function
 
#the derivative of the error function (x**4 = the power of 4 or x^4)
def slope_at_given_x_value(x):
   return 5 * x**4 - 6 * x**2
 
# Move X to the right or left depending on the slope of the error function
for i in range(num_iterations):
   previous_x = current_x
   current_x += -learning_rate * slope_at_given_x_value(previous_x)
   print(previous_x)
 
print("The local minimum occurs at %f" % current_x)

'''
������������� learning_rate������ͨ����б�ʵ��෴�����н����ƽ���͵㡣���⣬Խ�ӽ���͵㣬б��ԽС����˵�б�ʽӽ���ʱ��ÿһ���½��ķ��Ȼ�Խ��ԽС��

num_iterations ����Ԥ�Ƶ�����Сֵ֮ǰ����ĵ�������������ͨ�����Ըò���ѵ���Լ������ݶ��½��㷨��ֱ����
'''

# ------------------------------- ���Իع� Linear Regression -------------------------------

'''
��С���˷�����ݶ��½��㷨������һ�����������Իع���̡��� 20 ���� 50 ����� 60 �����һ��ʵ�龭��ѧ�������ڵļ������ʵ������Щ�뷨�����������ͨ��ʵ��� ���� �������ֹ��������ʵ�ֵġ�׼����Щ��׿�����Ҫ�����ʱ�䣬��ͨ�����������һ�λع���������Ҫ 24 Сʱ��
'''

#Price of wheat/kg and the average price of bread
wheat_and_bread = [[0.5,5],[0.6,5.5],[0.8,6],[1.1,6.8],[1.4,7]]
 
def step_gradient(b_current, m_current, points, learningRate):
    b_gradient = 0
    m_gradient = 0
    N = float(len(points))
    for i in range(0, len(points)):
        x = points[i][0]
        y = points[i][1]
        b_gradient += -(2/N) * (y - ((m_current * x) + b_current))
        m_gradient += -(2/N) * x * (y - ((m_current * x) + b_current))
    new_b = b_current - (learningRate * b_gradient)
    new_m = m_current - (learningRate * m_gradient)
    return [new_b, new_m]
 
def gradient_descent_runner(points, starting_b, starting_m, learning_rate, num_iterations):
    b = starting_b
    m = starting_m
    for i in range(num_iterations):
        b, m = step_gradient(b, m, points, learning_rate)
    return [b, m]
 
gradient_descent_runner(wheat_and_bread, 1, 1, 0.01, 100)

'''
���Իع鱾��û������ʲô�µ����ݡ����ǣ���ν��ݶ��½��㷨���õ������Ͼ���Ҫ���������ˡ����д��벢ʹ��������Իع�ģ����������������ɡ�
'''
# ------------------------------- ��֪�� Percepton -------------------------------

'''
����������������ʶһ�� Frank Rosenblatt������һ���������������ԣ�����Ѱ��������������ļһ1958�꣬��������һ��ģ����Ԫ�Ļ�����1958, Rosenblatt��������˵��ϡ�ŦԼʱ������ͷ������New Navy Device Learns By Doing����

����� Rosenblatt �Ļ���չʾ 50 ��ֱ������������б�ǵ�ͼ����������û��Ԥ�ȱ�̵�����·ֱ������ͼ�񣨱�ǵ�λ�ã������ڱ������������ӵ��ѧϰ�����Ļ������ˡ�
# ͼƬ�� http://mmbiz.qpic.cn/mmbiz_png/fhujzoQe7TqFYn0Uhvru5peBqHAyThLEMXibgvibRAhnR36lZbNTj1BkianVCwJX4WXMtfIIibeTKck77Z5ozFJu4g/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1

����ͼ��ʾ��ÿ��ѵ�����ڶ��Ǵ�����������ݿ�ʼ�������������������һ����ʼ�����Ȩ�ء�Ȼ��������ӡ�����ܺ�Ϊ�����������Ϊ 0���������Ϊ 1��

���Ԥ��������ȷ�ģ��Ͳ��ı�ѭ���е�Ȩ�ء����Ԥ�����Ǵ���ģ�������������ѧϰ������Ӧ�ص���Ȩ�ء�

�����þ���ġ����߼������и�֪����

# ͼƬ��https://mmbiz.qpic.cn/mmbiz_png/fhujzoQe7TqFYn0Uhvru5peBqHAyThLEmvWmK87c5nuP4nlr453L6pVic4cUDqqku6zmpvqnkeKZwpicPIpwF0GA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1
����������
'''

from random import choice
from numpy import array, dot, random
a1_or_0 = lambda x: 0 if x < 0 else 1
training_data = [ (array([0,0,1]), 0),
                    (array([0,1,1]), 1),
                    (array([1,0,1]), 1),
                    (array([1,1,1]), 1), ]
weights = random.rand(3)
errors = []
learning_rate = 0.2
num_iterations = 100
 
for i in range(num_iterations):
    input, truth = choice(training_data)
    result = dot(weights, input)
    error = truth - a1_or_0(result)
    errors.append(error)
    weights += learning_rate * error * input
    
for x, _ in training_data:
    result = dot(x, w)
    print("{}: {} -> {}".format(input[:2], result, a1_or_0(result)))


'''
��������ĳ���һ��֮��Marvin Minsky �� Seymour Papert ����������뷨��1969, Minsky & Papert������ʱ��Minsky �� Papert ������ʡ��ѧԺ�� AI ʵ���ҹ���������д��һ���飬֤����֪��ֻ�ܽ���������⡣���ǻ������˹��ڶ���֪�����뷨���ɱ����ǣ�Frank Rosenblatt ���������ȥ����

�� Minsky �� Papert ���鼮����һ��֮��һλ����˶ʿ�о���������ö���֪�������������������ۣ�Linnainmaa, 1970��������ҵ�������Ը�֪���ձ鲻���ã�ʮ������ AI ���о��ʽ�Ҳ�ǳ���ȱ������ AI �״����䡣

Minsky �� Papert �Ը�֪����������Ҫ��ԡ�������⡣����߼��롰���߼���ͬ������һ������ ���� ������ true ���ȡ�ͣ�1��1��ʱ��������� False��0����
# ͼƬ�� http://mmbiz.qpic.cn/mmbiz_png/fhujzoQe7TqFYn0Uhvru5peBqHAyThLEtfQnsxK9Ez7MBf1N29VZTHtCLMAX83gQGuOzf7bDEXZHRDtS2BB0og/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1
����ͼ��ʾ���ڡ����߼��У����ǿ��Խ� true �� false �ֿ������ǿ��Կ����������޷�ʹ��һ�����Ժ�����������߼��Ľ���������֡�
'''

# ------------------------------- �˹������� Artificial Neural Netowks -------------------------------

'''
�� 1986 �꣬����ʵ��֤������������Խ�����ӵķ��������⣨Rumelhart et al., 1986���� ��ʱ������������ٶȱȸ����������ʱ�����һ�򱶡�Rumelhart �����������������Ǻպ����������ĵģ�

����������һ���µ�����Ԫ����ѧϰ���̡������򴫲����ù���ͨ���������������е�����Ȩ�أ���С�������ʵ����������������������֮��Ĳ��졣����Ȩ�صĽ�����ǣ������������������ڲ������ء���Ԫ��Ϊ���������������Ҫ������������Щ��Ԫ�Ľ���������������е����������� ��������ڸ��򵥵ķ������硰��֪���������̡� Nature 323, 533 �C 536 (09 October 1986)�����򴫲����Դ�������õ���������

Ϊ�������ƪ���µĺ������ݣ��һ����������� DeepMind �Ŷ� Andrew Trask �Ĵ��롣�ⲻ��һ����ͨ�Ĵ��롣����������˹̹����ѧ Andrew Karpathy �����ѧϰ�γ̣��Լ� Siraj Raval �� Udacity �γ̡�����Ҫ���ǣ�������ˡ�������⣬Ҳ������ AI �����ʱ����
# ͼƬ��http://mmbiz.qpic.cn/mmbiz_png/fhujzoQe7TqFYn0Uhvru5peBqHAyThLEibUpic3c6GgbObayDLKWmGXemw0W0sRyVCel7Nzu5TydMibrFCe6YPiaow/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1
ѧϰ��δ���֮ǰ����������ͨ�����ģ��������ѧϰһ������Сʱ������������ĺ����߼���Ȼ���Ķ� Trask �Ĳ��ͣ�Ȼ�����Ķ��ĴΡ���Ҫע�⵽��X_XOR ��������ӵĲ��� [1] ��ƫ����Ԫ�����ǵȼ������Ժ����еĳ����

'''

import numpy as np
 
X_XOR = np.array([[0,0,1], [0,1,1], [1,0,1],[1,1,1]])
y_truth = np.array([[0],[1],[1],[0]])
 
np.random.seed(1)
syn_0 = 2*np.random.random((3,4)) - 1
syn_1 = 2*np.random.random((4,1)) - 1
 
def sigmoid(x):
    output = 1/(1+np.exp(-x))
    return output
def sigmoid_output_to_derivative(output):
    return output*(1-output)
 
for j in range(60000):
    layer_1 = sigmoid(np.dot(X_XOR, syn_0))
    layer_2 = sigmoid(np.dot(layer_1, syn_1))
    error = layer_2 - y_truth
    layer_2_delta = error * sigmoid_output_to_derivative(layer_2)
    layer_1_error = layer_2_delta.dot(syn_1.T)
    layer_1_delta = layer_1_error * sigmoid_output_to_derivative(layer_1)
    syn_1 -= layer_1.T.dot(layer_2_delta)
    syn_0 -= X_XOR.T.dot(layer_1_delta)
    
print("Output After Training: n", layer_2)

'''
���򴫲�������˷����ݶ��½�����һ������˺�����⡣������̵Ŀ��ӻ�ͨ���Ƕ��䱳��ԭ��ļ򻯡�רע������䱳����߼�������Ҫ����ؿ���ֱ���ϵ���⡣

���⣬������Ҳ���Կ��� Andrew Karpathy ���ڷ��򴫲��Ŀγ̣���������ӻ���վ����ѧϰ���Լ��Ķ� Michael Nielsen ���ڷ��򴫲����½ڡ�
'''

# ------------------------------- ��������� Deep Neural Netowks -------------------------------

'''
�������������������������֮����ж���м��������硣��������������� Rina Dechter (Dechter, 1986) ����ģ�����2012�꣬Ҳ������ IBM ���˹����ܳ��� Watson Ӯ��������������������Ŀ Jeopardy �� Google �Ƴ�è��ʶ����֮����ܵ��㷺��ע��

�����������֮ǰ������ĺ��Ľṹ��ͬ������Ӧ����һЩ��ͬ�����⡣�����򻯷���Ҳ�кܴ�Ľ����������ֻ��һ�����������ӵĵ������ݵ���ѧ������Tikhonov��A.N.��1963���������ڱ������������У��Լ�ǿ�䷺��������

���ּ������ºܴ�̶��������ڼ������������������������������������������о��ߵĴ������� ���� ���� GPU ����ֻ������ӾͿ������һ����ʮ������ڵĳ��������һ�����������

����ɱ��Ľ��ͺ͸������ѧϰ��ķ�չ�����ѧϰ�����˴�����Ұ����������һ�����������ѧϰ��ջʾ�����ӵײ㿪ʼ��

GPU > Nvidia Tesla K80����Ӳ��������ͼ�δ����������ѧϰ���ٶ�ƽ��Ҫ�� CPU ��50-200����
CUDA > GPU �ĵײ�������
CuDNN > Nvidia �Ŀ⣬�����Ż� CUDA
Tensorflow > �� Google ���������� CuDNN �����ѧϰ���
TFlearn > Tensorflow ��ǰ�˿��

�������������� MNIST ���ַ���ͼ�������������ѧϰ�� ��Hello World����

# ͼƬ��http://mmbiz.qpic.cn/mmbiz_png/fhujzoQe7TqFYn0Uhvru5peBqHAyThLEYTL4jciaLCt55iaF9O3ueLCDicTdJ46EFsCAfM8zSnvlNdic1x9kPAyiaUw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1

������ TFlearn ��ʵ�֣�
'''

#from __future__ import division, print_function, absolute_import
import tflearn
from tflearn.layers.core import dropout, fully_connected
from tensorflow.examples.tutorials.mnist import input_data
from tflearn.layers.conv import conv_2d, max_pool_2d
from tflearn.layers.normalization import local_response_normalization
from tflearn.layers.estimator import regression
 
# Data loading and preprocessing
mnist = input_data.read_data_sets("/data/", one_hot=True)
X, Y, testX, testY = mnist.train.images, mnist.train.labels, mnist.test.images, mnist.test.labels
X = X.reshape([-1, 28, 28, 1])
testX = testX.reshape([-1, 28, 28, 1])
 
# Building convolutional network
network = tflearn.input_data(shape=[None, 28, 28, 1], name='input')
network = conv_2d(network, 32, 3, activation='relu', regularizer="L2")
network = max_pool_2d(network, 2)
network = local_response_normalization(network)
network = conv_2d(network, 64, 3, activation='relu', regularizer="L2")
network = max_pool_2d(network, 2)
network = local_response_normalization(network)
network = fully_connected(network, 128, activation='tanh')
network = dropout(network, 0.8)
network = fully_connected(network, 256, activation='tanh')
network = dropout(network, 0.8)
network = fully_connected(network, 10, activation='softmax')
network = regression(network, optimizer='adam', learning_rate=0.01,
                        loss='categorical_crossentropy', name='target')
 
# Training
model = tflearn.DNN(network, tensorboard_verbose=0)
model.fit({'input': X}, {'target': Y}, n_epoch=20,
            validation_set=({'input': testX}, {'target': testY}),
            snapshot_step=100, show_metric=True, run_id='convnet_mnist')

'''
���� MNIST ���⣬�кܶ಻������£�

https://www.tensorflow.org/get_started/mnist/beginners

https://www.youtube.com/watch?v=NMd7WjZiCzc

https://www.oreilly.com/learning/not-another-mnist-tutorial-with-tensorflow

����������������˽� TFlearn�����������֮ǰ�����¡�
'''

'''
С��

���Ǵ� TFlearn ��ʾ���п��Կ��������ѧϰ�Ļ����߼����� Rosenblatt �ĸ�֪�����ơ� ������������ʹ�� Relu ������������Ƕ�Ԫ Heaviside ��Ծ�������ھ������������һ�㣬��ʧ����ʹ�õ��� categorical_crossentropy�������ཻ���ء����Ƕ� Legendre ��С���˷��ĸĽ��������ڶ�����߼��ع����⡣������Ż��㷨 adam ��Դ�� Debye ���ݶ��½���Tikhonov �����򻯸����� dropout ������򻯺��� L1/L2 ����ʽ�õ��㷺Ӧ�á�

�������Ҫ��������ĸ����Լ����ʵ����һ����ֱ�۵���⣬���Ķ����� FloydHub �����Ϸ�������£��ҵĵ�һ�����ѧϰ��ĩ��

��л Ignacio Tonoli��Brian Young��Paal Ringstad��Tomas Moska �� Charlie Harrington �������ı��ĵĲݸ塣������Դ������ Jupyter notebook �С�

���� Emil Wallner

���� Emil ���������ѧϰϵ�еĵڶ����֡�Emil ����ʮ��ʱ��̽���˹�ѧϰ��������ţ���ѧ��ѧԺ������Ͷ�ʽ�����ҵ��˾�����������˼�����ѧҵ��ȥ�꣬������ Ecole 42�������Լ����˹�ѧϰ�����֪ʶӦ���ڻ���ѧϰ��
'''



