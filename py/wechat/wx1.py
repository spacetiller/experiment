#!/usr/bin/env python
#coding: utf8

import requests
import wxpy
from bs4 import BeautifulSoup

# 微信网页登陆
bot = wxpy.Bot(console_qr=2,cache_path='botoo.pkl')

# 获取心灵鸡汤中的最新内容，可以参考其他爬虫随便查看怎么爬虫
def get_msg():
    url = 'http://www.59xihuan.cn/index_1.html'
    h = requests.get(url)
    html = h.text
    news_bf = BeautifulSoup(html,"html.parser")
    msg = news_bf.find('div', class_='pic_text1')
    news = msg.text
    # print(msg)
    # print(news)
    return news

# 给朋友发送消息
def send_msg():
    try:
        # 添加朋友微信昵称
        friend = bot.friends().search(u'文件传输助手')[0]
        friend.send(get_msg())
    except:pass


if __name__ == '__main__':
    send_msg()


