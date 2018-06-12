#!/usr/bin/env python

import Image

def pic2txt(infile,outfile):
    ff = open(outfile,'w')
    f = Image.open(infile)
    width,height = f.size
    ff.write('['+str(height)+']['+str(width)+']\n') #����Сд����һ��
    s = f.tostring() #��ͼƬ����ת��Ϊ������
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
    if n<mid_val: #��mid_valΪ��ֵ
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
    infile = 'yaml.bmp' #Ҫ��ȡ��Ŀ��ͼƬ
    outfile = 'result.txt' #Ҫд��������ļ�
    pic2txt(infile,outfile)
