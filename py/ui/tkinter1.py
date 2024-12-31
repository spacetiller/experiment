# coding=utf-8
from tkinter import *
master = Tk()
master.geometry("999x999")
#===============标签label

l_show=Label(master,text="kun")# 创建带标题的label的标签
photo=PhotoImage(file="q.png")
l_show1=Label(master,image=photo)
l_show.pack(side="left")
l_show1.pack(side="left")

#====输入框
e_show=Entry(master,width=10)
e_show.pack(side="left")


#======多行文本输入框



mainloop()
