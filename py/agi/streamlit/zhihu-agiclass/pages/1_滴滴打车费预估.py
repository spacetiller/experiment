import json
import logging

from openai import OpenAI

from tools.utils import *
from tools.amap import get_distance_time


# ====4=-= = Streamlit 页面内容 ==-= =二二二=
st.set_page_config(
    page_title="滴滴打车车费预估🚗💰",
    page_icon="点"
)

st.title("滴滴打车车费预估🚗")
# 下面这句给老板展示时要酌情修改,说人话
st.caption("🚀 使用OpenAI Assistants API 结合 RAG、Code interpreter、Function call三大能力,实现了一个滴滴打车车费预估的Demo")


# ==-= 初始化T作
# 日志级别设置
logging.basicConfig(level=logging.INFO)

# 初始化OpenAI
client = OpenAI()

# 本地工具函数与OpenAI的函数映射。这里定义好,方便后面动态调用
available_functions = {
    'get_current_time': get_current_time,
    'get_distance_and_duration': get_distance_time,
}
# 获取已经在PLayground中创建好的Assistants
# assistant = client.beta.assistants.retrieve('asst_76TXadFEFQjNz7AY1bPDefaP')
assistant = client.beta.assistants.retrieve("asst_76TXadFEFQjNz7AY1bPDefaP")

# ===== Streamlit 对话框架初始化，====:
# 初始化messages列表到Streamlit的session state中
if "messages" not in st.session_state:
    st.session_state["messages"] = [{"role": "assistant", "content": "我是你的打车助手，请问你要从哪里出发?"}]

# 初始化thread到Streamlit的session_state中
if "thread" not in st.session_state:
    thread = client.beta.threads.create()
    logging.info(f'创建了新的thread: thread.id]')
    st.session_state["thread"] = thread

# 将st中的messages列表中的消息显示出来
for msg in st.session_state.messages :
    st.chat_message(msg["role"], avatar = ICON_AI if msg["role"] == 'assistant' else ICON_USER).write(msg["content"])

##########################################################################################
##### 如果有bug，st.chat_input() 无法用户输入内容的话，就改用下面的代码
# def print_text():
#     print(st.session_state.user_input)
#     if st.session_state.user_input is not None:
#         prompt = st.session_state.user_input
# prompt = st.chat_input(random_placeholder_text(), on_submit=print_text, key="user_input")
# logging.info(f'用户输入: prompt]')
#
# # if prompt:
# # if prompt := st.chat_input(random_placeholder_text()):


if prompt := st.chat_input():
    # 将用户的输入存储到st的messages列表中,井显示出来
    append_and_show("user", prompt)

    # 创建OpenAI的message
    message = client.beta.threads.messages.create(thread_id=st.session_state.thread.id, role="user", content=prompt)
    # 创理OpenAT的run
    run = client.beta.threads.runs.create(thread_id=st.session_state.thread.id, assistant_id=assistant.id)

    while True:
        try:
            # 如果在队列中或还在执行中，则等待并轮询更新run状态
            if run.status == 'queued' or run.status == 'in_progress':
                logging.info(f'等待run完成，now: {run.status}')
                time.sleep(3)
                run = client.beta.threads.runs.retrieve(thread_id = st.session_state.thread.id, run_id=run.id)
                logging.debug(run)


            # 如果需要action，则依次执行本地方法并返回结果
            elif run.status == 'requires_action':
                # 提交tool outputs
                run = client .beta.threads .runs.submit tool outputs(thread id=st.session state.thread.id,
                run_id = run.id,
                tool_outputs = tool_outputs_append and show(role: "assistant"， content: "本地执行完成，我将继续，请稍等")T

            # 如果完成
            elif run.status == 'completed':
                ...
        except Exception as e:
            logging.debug(e)
            append_and_show("assistant", '我好像出错了，请重试')
            continue
















