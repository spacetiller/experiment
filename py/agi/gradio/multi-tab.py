import numpy as np
import gradio as gr

# 导入必要的库

def flip_text(x):
    return x[::-1]

# 定义翻转文本函数

def flip_image(x):
    return np.fliplr(x)

# 定义翻转图片函数，使用了NumPy中的fliplr函数

with gr.Blocks() as demo:
    gr.Markdown("Flip text or image files using this demo.")

    # 创建一个包含Markdown说明的示例块

    with gr.Tab("Flip Text"):
        text_input = gr.Textbox()
        text_output = gr.Textbox()
        text_button = gr.Button("Flip")

        # 创建一个用于翻转文本的选项卡，包含一个文本输入框、一个文本输出框和一个按钮

    with gr.Tab("Flip Image"):
        with gr.Row():
            image_input = gr.Image()
            image_output = gr.Image()
        image_button = gr.Button("Flip")

        # 创建一个用于翻转图片的选项卡，包含一个图片输入框、一个图片输出框和一个按钮

    with gr.Accordion("Open for More!"):
        gr.Markdown("Look at me...")

        # 创建一个手风琴部分，包含一个Markdown文本

    text_button.click(flip_text, inputs=text_input, outputs=text_output)
    image_button.click(flip_image, inputs=image_input, outputs=image_output)

    # 为按钮添加点击事件，点击时调用相应的翻转函数

demo.launch()

# 启动Gradio演示
