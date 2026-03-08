# deprecated: import google.generativeai as genai
from google import genai
from google.genai import types
import os

genai.configure(api_key="AIzaSyBkkzs9FsVR1aGejjLjwkSL-Kiwxwc_tIE")

model = genai.GenerativeModel("gemini-3-pro-image-preview")  # Nano Banana Pro

response = model.generate_content(
    "一张赛博朋克风格的东京夜景，霓虹灯上写着中文‘纳米香蕉 Pro’，超高清，电影感",
    generation_config={
        "response_mime_type": "application/json",  # 返回 JSON，包含图像 base64
    }
)

# 保存图像
import json, base64
data = json.loads(response.text)
with open("output.png", "wb") as f:
    f.write(base64.b64decode(data["candidates"][0]["content"]["parts"][0]["inline_data"]["data"]))

print("生成完成！")

