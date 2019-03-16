# _*_ coding: utf-8 _*_
# ����: yhao
# ����: http://blog.csdn.net/yhao2014
# ����: yanhao07@sina.com

# ѵ����
# ÿ����������3������ (x0,x1,x2)
x = [(1, 0., 3), (1, 1., 3), (1, 2., 3), (1, 3., 2), (1, 4., 4)]
# y[i] �������Ӧ�����
y = [95.364, 97.217205, 75.195834, 60.105519, 49.342380]

# ������ֵ�������ε�����ʧ����֮��С�ڸ÷�ֵʱֹͣ����
epsilon = 0.0001

# ѧϰ��
alpha = 0.01
diff = [0, 0]
max_itor = 1000
error1 = 0
error0 = 0
cnt = 0
m = len(x)


# ��ʼ������
theta0 = 0
theta1 = 0
theta2 = 0

while True:
    cnt += 1

    # ������������
    for i in range(m):
        # ��Ϻ���Ϊ y = theta0 * x[0] + theta1 * x[1] +theta2 * x[2]
        # ����в�
        diff[0] = (theta0 + theta1 * x[i][1] + theta2 * x[i][2]) - y[i]

        # �ݶ� = diff[0] * x[i][j]
        theta0 -= alpha * diff[0] * x[i][0]
        theta1 -= alpha * diff[0] * x[i][1]
        theta2 -= alpha * diff[0] * x[i][2]

    # ������ʧ����
    error1 = 0
    for lp in range(len(x)):
        error1 += (y[lp]-(theta0 + theta1 * x[lp][1] + theta2 * x[lp][2]))**2/2

    if abs(error1-error0) < epsilon:
        break
    else:
        error0 = error1

    print ' theta0 : %f, theta1 : %f, theta2 : %f, error1 : %f' % (theta0, theta1, theta2, error1)
print 'Done: theta0 : %f, theta1 : %f, theta2 : %f' % (theta0, theta1, theta2)
print 'Iter times: %d' % cnt
