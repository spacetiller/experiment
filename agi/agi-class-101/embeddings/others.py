import numpy as np
from numpy import dot
from numpy.linalg import norm

from openai import OpenAI
client = OpenAI()

def cos_sim(a, b):
    """余弦距离 -- 越大越相似"""
    return dot(a, b)/(norm(a)*norm(b))
def l2(a, b):
    """欧式距离 -- 越小越相似"""
    x = np.asarray(a)-np.asarray(b)
    return norm(x)

def get_embeddings(texts, model="text-embedding-ada-002"):
    data = client.embeddings.create(input=texts, model=model).data
    return [x.embedding for x in data]


test_arr = ["我是一段测试文本"]
vs = get_embeddings(test_arr)[0]
print(vs[:10])
# print(len(vs))  # 1536


query = "国际争端"
documents = [
    "联合国就苏丹达尔富尔地区大规模暴力事件发出警告",
    "土耳其、芬兰、瑞典与北约代表将继续就瑞典“入约”问题进行谈判",
    "日本岐阜市陆上自卫队射击场内发生枪击事件 3人受伤",
    "我国首次在空间站开展舱外辐射生物学暴露实验",
    "国家游泳中心(水立方) : 恢复游泳、嬉水乐园等水上项目运营",
]
query_vec = get_embeddings([query])[0]
doc_vecs = get_embeddings(documents)
print("Cosine distance.")
print(cos_sim(query_vec, query_vec))
for vec in doc_vecs:
    print(cos_sim(query_vec, vec))

print("\nEuclidean distance:")
print(l2(query_vec, query_vec))
for vec in doc_vecs:
    print(l2(query_vec, vec))
