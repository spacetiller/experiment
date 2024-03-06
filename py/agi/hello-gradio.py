import gradio as gr

# 定义一个问候函数，接收一个名字作为输入，返回一个带有问候语的文本输出
def greet(name):
    return "你好，" + name + "！"

# 创建一个Gradio界面，将greet函数作为输入和输出函数传递给它
iface = gr.Interface(fn=greet, inputs="text", outputs="text")

# 启动Gradio应用程序
iface.launch()
