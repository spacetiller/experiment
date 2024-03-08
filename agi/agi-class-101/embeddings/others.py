import numpy as np
from numpy import dot
from numpy.linalg import norm

from openai import OpenAI   # openai=1.10.0
client = OpenAI()
#
# # def get_completion(prompt, context=[], model="gpt-3.5-turbo"):
# def get_completion(prompt, model="gpt-3.5-turbo"):
#     """封装 openai 接口"""
#     messages = [{"role": "user", "content": prompt}]
#     response = client.completions.create(
#         model=model,
#         prompt=prompt,
#         temperature=0,  # 模型输出的随机性，0 表示随机性最小
#     )
#     return response.choices[0].message["content"]

from vectordb_utils import InMemoryVecDB
from pdf_utils import extract_text_from_pdf
from openai_utils import get_completion

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
# vs = get_embeddings(test_arr)[0]
# print(vs[:10])
# print(len(vs))  # 1536


query = "国际争端"
documents = [
    "联合国就苏丹达尔富尔地区大规模暴力事件发出警告",
    "土耳其、芬兰、瑞典与北约代表将继续就瑞典“入约”问题进行谈判",
    "日本岐阜市陆上自卫队射击场内发生枪击事件 3人受伤",
    "我国首次在空间站开展舱外辐射生物学暴露实验",
    "国家游泳中心(水立方) : 恢复游泳、嬉水乐园等水上项目运营",
]
# query_vec = get_embeddings([query])[0]
# doc_vecs = get_embeddings(documents)
# print("Cosine distance.")
# print(cos_sim(query_vec, query_vec))
# for vec in doc_vecs:
#     print(cos_sim(query_vec, vec))
#
# print("\nEuclidean distance:")
# print(l2(query_vec, query_vec))
# for vec in doc_vecs:
#     print(l2(query_vec, vec))


paragraphs = extract_text_from_pdf("/Users/zhanghui/.jupyter/zhihu-agi/zhihu/chatpdf/llama2-extracted.pdf", page_numbers=[2,3], min_line_length=10)

vector_db = InMemoryVecDB("demo") # get_embeddings
vector_db.add_documents(paragraphs)

user_query = "llama2有多少参数"
result = vector_db.search(user_query, 2)
# for para in result: # ["documents"][0]:
#     print(para+"\n")



prompt_template = """
你是一个问答机器人。
你的任务是根据下述给定的已知信息回答用户问题。
确保你的回复完全依据下述已知信息。不要编造答案如果下述已知信息不足以回答用户的问题，请直接回复“我无法回答您的问题”

已知信息：
INFO

用户问：
QUERY

请用中文回答用户问题。
"""

def build_prompt(prompt_template, **kwargs):
    '''将 Prompt 模板赋值'''
    prompt = prompt_template
    for k, v in kwargs.items( ) :
        if isinstance(v, str):
            val = v
        elif isinstance(v, list) and all(isinstance(elem, str) for elem in v):
            val = '\n'.join(v)
        else:
            val = str(v)
        prompt = prompt.replace(f"{k.upper()}", val)
    return prompt

class RAG_Bot:
    def __init__ (self, vector_db, llm_api, n_results=2):
        self.vector_db = vector_db
        self.llm_api = llm_api
        self.n_results = n_results

    def chat(self, user_query) :
        # 1. 检索
        search_results = self.vector_db.search(user_query, self.n_results)

        # 2.构建 Prompt
        prompt = build_prompt(prompt_template, info=search_results[0], query=user_query)
        print(prompt)

        # 3.调用 LLM
        response = self.llm_api(prompt)
        return response

#创建一个RAG机器人
bot = RAG_Bot(
    vector_db,
    llm_api=get_completion
)
user_query ="llama2有多少参数"
response = bot.chat(user_query )

print(response)