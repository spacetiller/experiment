from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class People(BaseModel):
    name: str
    age: int
    address: str
    salary: float

@app.get('/')
def index():
    return {'message': '你已经正确创建 FastApi 服务！'}

@app.get('/query/{uid}')
def query(uid: int):
    msg = f'你查询的 uid 为：{uid}'
    return {'success': True, 'msg': msg}

@app.post('/insert')
def insert(people: People):
    age_after_10_years = people.age + 10
    msg = f'此人名字叫做：{people.name}，十年后此人年龄：{age_after_10_years}'
    return {'success': True, 'msg': msg}






