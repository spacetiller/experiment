# -*- encoding: utf-8 -*-

import cv2
import numpy as np
path = "13.png"
img = cv2.imread(path)
height, width, depth = img.shape[0:3]
print(height)
#图片二值化处理，把[240, 240, 240]~[255, 255, 255]以外的颜色变成0
thresh = cv2.inRange(img, np.array([240, 240, 240]), np.array([255, 255, 255]))
print(thresh)
#创建形状和尺寸的结构元素
kernel = np.ones((3, 3), np.uint8)
print(kernel)

#扩张待修复区域
hi_mask = cv2.dilate(thresh, kernel, iterations=1)
specular = cv2.inpaint(img, hi_mask, 5, flags=cv2.INPAINT_TELEA)
cv2.namedWindow("Image", 0)
cv2.resizeWindow("Image", int(width / 2), int(hight / 2))
cv2.imshow("Image", img)
cv2.namedWindow("newImage", 0)
cv2.resizeWindow("newImage", int(width / 2), int(hight / 2))
a=cv2.imshow("newImage", specular)
cv2.imwrite("43.jpg",specular)
cv2.waitKey(0)
cv2.destroyAllWindows()

import cv2
import os
import numpy as np
sta=0
for file in os.listdir("cut_test"):
    sta=sta+1
    print("正在处理"+"cut_test/" + file)
    img = cv2.imread("cut_test/" + file)
    #img=cv2.imread('1.jpg')
    rows,cols,channels = img.shape
    cropped = img[0:479, 0:cols]
    #转换hsv
    hsv=cv2.cvtColor(cropped,cv2.COLOR_BGR2HSV)
    # 图片二值化处理，把[240, 240, 240]~[255, 255, 255]以外的颜色变成0
    thresh = cv2.inRange(hsv, np.array([90,10,125]), np.array([135,180,255]))
    erode = cv2.erode(thresh, None, iterations=2)
    dilate = cv2.dilate(erode, None, iterations=0)
    # 创建形状和尺寸的结构元素
    kernel = np.ones((3, 3), np.uint8)



	# 扩张待修复区域
    hi_mask = cv2.dilate(dilate, kernel, iterations=1)
    specular = cv2.inpaint(cropped, hi_mask, -5, flags=cv2.INPAINT_NS)
    #合并
    htich = np.vstack((specular, img[479:rows, 0:cols]))
    '''
    blue=[]
    #获取mask,调整lower中h控制颜色
    lower_blue=np.array([90,10,125])
    upper_blue=np.array([135,180,255])
    mask = cv2.inRange(hsv, lower_blue, upper_blue)
    erode=cv2.erode(mask,None,iterations=1)
    dilate=cv2.dilate(erode,None,iterations=1)
    #腐蚀膨胀
    erode=cv2.erode(mask,None,iterations=1)
    cv2.imshow('erode',erode)
    dilate=cv2.dilate(erode,None,iterations=1)
    cv2.imshow('dilate',dilate)
    for i in range(rows):
        for j in range(cols):
            if dilate[i,j]==255:
                blue.append([i,j])
    for w in blue:
        x=w[0]
        y=w[1]
        img[x,y]=[255,255,255]
    '''
    cv2.imwrite("dels_test/" + str(sta) + ".jpg", htich)
'''
    cv2.imshow('Mask', img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
'''
