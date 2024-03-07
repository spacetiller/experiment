from fastapi import FastAPI
from telecom_service import *
from chat_service import *


app = FastAPI()

prompt_templates = {
    "recommand" : "用户说：__INPUT__ \n\n向用户介绍如下产品：__NAME__，月费__PRICE__元，每月流量__DATA__G。",
    "not_found" : "用户说：__INPUT__ \n\n没有找到满足__PRICE__元价位__DATA__G流量的产品，询问用户是否有其他选择倾向。"
}
dm = DialogManager(prompt_templates)
chat = Chat()

@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}


@app.get("/chat/{input}")
async def say_hello(input: str):
    print("===input===")
    print(input)
    response = chat.chat(input)
    print("===response===")
    print(response)
    return {"response": f"{response}"}

 
@app.get("/telecom/{input}")
async def say_hello(input: str):
    print("===input===")
    print(input)
    response = dm.run(input)
    # response = dm.run("300太贵了，200元以内有吗")
    print("===response===")
    print(response)
    return {"response": f"{response}"}

if __name__ == "__main__":
    response = dm.run("300太贵了，200元以内有吗")
    print("===response===")
    print(response)
