import websocket
import time

accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzY3MDU3MjgsImlkIjoxMCwidXNlck5hbWUiOiJ5YXFpYW5nIn0.TRZPoUiJqAwk6j68Sv_h4GVnKRkdoMTCddumSLCzVpc"
wsUrl = "ws://localhost:10010/dct-service-abquant/ws/business?access_token="
#wsUrl = "wss://dct-test001-internal.wecash.net/dct-service-abquant/ws/business?access_token="

ws = websocket.WebSocket()

ws.connect(wsUrl + accessToken)
print("ping")
ws.ping()

for index in range(1, 10):
    ws.send("client message" + str(index))
    time.sleep(2)

ws.close()
