from multiprocessing.dummy import Pool as ThreadPool
import time
import requests

# 先写一个最简单的访问网页，获取网页内容的函数geturl
def geturl(url):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE'}
    text = requests.get(url, headers=headers).text[:100]
    return text

# 需要循环访问的url列表
urls = [
    'http://www.baidu.com',
    'http://home.baidu.com/',
    'http://tieba.baidu.com/',
    'http://zhidao.baidu.com/',
    'http://music.baidu.com/',
    'http://image.baidu.com/',
    'http://python-china.org/'
]

# 使用普通循环的方法运行
start = time.time()
results = list(map(geturl, urls))
print('Normal:', time.time() - start)

# 使用多线程的方式运行,在这里我们使用processes参数为4
start2 = time.time()
pool = ThreadPool(processes=4)
result2 = pool.map_async(geturl, urls)
pool.close()
pool.join()
print('Thread Pool:', time.time() - start2)


