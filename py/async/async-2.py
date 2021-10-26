import os
import re
import sys
 
import aiohttp
import asyncio
import async_timeout
 
import progressbar
 
from imgurpython import ImgurClient
 
regex = re.compile(r'\.(\w+)$')
def get_extension(link):
 ext = regex.search(link).group()
 
 return ext
 
i = 1
async def download_img(img, session):
 global i, bar
 
 # get the file extension
 file_ext = get_extension(img.link)
 # create unique name by combining file id with its extension
 file_name = img.id + file_ext
 
 resp = await session.get(img.link)
 with open(file_name, 'wb') as f:
  async for chunk in resp.content.iter_chunked(1024):
   f.write(chunk)
 
 bar.update(i)
 i += 1
 
try:
 album_id = sys.argv[1]
except IndexError:
 raise Exception('Please specify an album id')
 
client_id = os.getenv('IMGUR_CLIENT_ID')
client_secret = os.getenv('IMGUR_CLIENT_SECRET')
client = ImgurClient(client_id, client_secret)
 
img_lst = client.get_album_images(album_id)
bar = progressbar.ProgressBar(max_value=len(img_lst))
 
async def main():
 tasks = []
 async with aiohttp.ClientSession() as session:
  for img in img_lst:
   task = asyncio.ensure_future(download_img(img, session))
   tasks.append(task)
 
  await asyncio.gather(*tasks)
 
loop = asyncio.get_event_loop()
future = asyncio.ensure_future(main())
loop.run_until_complete(future)
