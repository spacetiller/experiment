import numpy as np
import random
import matplotlib.pyplot as plt

meanX, stdX=10,0.3
n=1000 #这里的n就是蒙特卡洛模拟的随机数生成器
x=np.random.normal(meanX, stdX, n) #使用numpy内置的正态分布函数random.normal(),随机产生x1000次

y=x*10+x**2+5
np.shape(y)
# (1000,)

meanY=np.mean(y)
stdY=np.std(y)
# meanY
# 205.26338508878402
# stdY
# 9.301438243719513

# 查看一下x和y随机产生了那些数值
fig,axes=plt.subplots(1,2,figsize=(8,4),constrained_layout=True)
axes[0].bar(np.arange(n),x)
axes[1].bar(np.arange(n),y)
axes[0].set_xlabel('n')
axes[0].set_ylabel('x')
axes[1].set_xlabel('n')
axes[1].set_ylabel('y')
plt.show()

#最后将x和y根据正态分布函数可视化
countX, binsX, ignoredX = plt.hist(x, 30, density=True)
plt.plot(binsX, 1/(stdX * np.sqrt(2 * np.pi)) *
               np.exp( - (binsX - meanX)**2 / (2 * stdX**2) ),
                        linewidth=2, color='r')
plt.xlabel('x')
plt.show()

countY, binsY, ignoredY = plt.hist(y, 30, density=True)
plt.plot(binsY, 1/(stdY * np.sqrt(2 * np.pi)) *
               np.exp( - (binsY - meanY)**2 / (2 * stdY**2) ),
                        linewidth=2, color='b')
plt.xlabel('y')
plt.show()
