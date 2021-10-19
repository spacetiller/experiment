import requests

url = "https://dct-test001.wecash.net/dct-business-api/login?userName=zhanghui&password=123456"
#url = "https://10.119.13.16:10000/dct-business-api/login?userName=zhanghui&password=123456"

payload={}
headers = {
    'Content-Type': 'application/json; charset=UTF-8'
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
