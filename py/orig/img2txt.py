#!/usr/bin/env python

import Image

def pic2txt(infile,outfile):
    ff = open(outfile,'w')
    f = Image.open(infile)
    width,height = f.size
    ff.write('['+str(height)+']['+str(width)+']\n') #将大小写到第一行
    s = f.tostring() #将图片内容转换为字条串
    I = 0

    #get the proper mid pixel value
    min_val = ord(min(s))
    max_val = ord(max(s))
    mid_val = (min_val+max_val)/2
    print "min:mid:max = ",min_val,":",mid_val,":",max_val
    #jpg maybe RGB or Gray
    isGray = 1
    if width*height*3 == len(s):
            isGray = 3

    #start to sample
    while I<width*height*isGray:
    n = ord(s[I])
    if n<mid_val: #以mid_val为阈值
        n = 0
    else:
        n = 255
    ff.write(str(n))
    ff.write(",")
    I = I + isGray 
    if I%(width*isGray) == 0:
        ff.write("\n")

    ff.close()

if __name__=="__main__":
    infile = 'yaml.bmp' #要读取的目标图片
    outfile = 'result.txt' #要写入的最终文件
    pic2txt(infile,outfile)
