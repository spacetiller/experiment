import turtle

# 创建一个 turtle 对象
t = turtle.Turtle()

# 绘制一个正方形
for _ in range(4):
    t.forward(100)
    t.right(90)

# 保持窗口显示
turtle.done()
