import numpy as np
import random
from tkinter import *
from PIL import ImageTk, Image

# game_map = [
#     [1, 1, 1, 1, 1, 1],
#     [1, 0, 0, 0, 0, 1],
#     [1, 0, 0, 0, 0, 1],
#     [1, 0, 0, 0, 0, 1],
#     [1, 1, 1, 1, 1, 1]
# ]
# # 0空，1墙，2人，3鸡腿，4雷电，5穿越之门
game_map = [
    [1, 1, 1, 1, 1, 1],
    [1, 2, 0, 3, 0, 1],
    [1, 0, 0, 0, 0, 1],
    [1, 0, 4, 0, 5, 1],
    [1, 1, 1, 1, 1, 1]
]

rows = len(game_map)  # 数组行数
cols = len(game_map[0]) # 数组列数
cell_size = 48 # 一个格子的尺寸
width = cell_size*cols # 画面总宽度
height = cell_size*rows # 画面总高度


def draw(canvas, game_map):
    # 白色幕布
    canvas.create_rectangle(0, 0, width, height, fill="white")
    for y in range(rows): # 循环格子
        for x in range(cols):
            v = game_map[y][x] # 根据元素画出图形
            cell_x = x*cell_size
            cell_y = y*cell_size
            # 画出围墙
            if v == 1:
                canvas.create_image(cell_x, cell_y, anchor='nw', image=wall_img)

root = Tk()
wall = Image.open("block.png") # 加载一个围墙图片
wall_img = ImageTk.PhotoImage(wall)
chicken = Image.open("chicken.png") # 加载一个鸡腿# 图片
chicken_img = ImageTk.PhotoImage(chicken)
lightning = Image.open("lightning.png") # 加载一个闪电图片
lightning_img = ImageTk.PhotoImage(lightning)
canvas = Canvas(root, width=width, height=height)
canvas.pack()
draw(canvas, game_map)
root.mainloop()


