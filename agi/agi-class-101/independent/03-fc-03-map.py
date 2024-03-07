## Function Calling 实例 5：地图
from openai import OpenAI
import os, json, copy

client = OpenAI()

import requests

amap_key ="6d672e6194caa3b639fccf2caf06c342"

def get_location_coordinate(location, city):
    url = f"https://restapi.amap.com/v5/place/text?key={amap_key}&keywords={location}&region={city}"
    print(url)
    r = requests.get(url)
    result = r.json()
    if "pois" in result and result["pois"]:
        return result["pois"] [0]
    return None

def search_nearby_pois(longitude, latitude, keyword):
    url = f"https://restapi.amap.com/v5/place/around?key={amap_key}&keywords={keyword}&loca"
    print(url)
    r = requests.get(url)
    result = r.json()
    ans = ""
    if "pois" in result and result["pois"]:
        for i in range(min(3, len(result["pois"]))):
            name = result["pois"] [i] ["name"]

    if "pois" in result and result["pois"]:
        for i in range(min(3, len(result[")pois"]))):
            name = result["pois"] [i] ["name"]
            address = result["pois"][i]["address"]
            distance = result["pois"][i]["distance"]
            ans += f"{name}\n{address}\n距离: {distance}米\n\n"
    return ans


prompt = "我想在北京五道口附近喝咖啡，给我推荐几个"
# prompt =“我到北京出差，给我推荐三里屯的酒店，和五道口附近的咖啡
messages = [
    {"role": "system", "content": "你是一个地图通，你可以找到任何地址。"},
    {"role": "user", "content": prompt}
]

response = get_completion(messages)
messages.append(response)
# 把大模型的回复加入到对话中
print("=====GPT回复=====")
print(json(response))
