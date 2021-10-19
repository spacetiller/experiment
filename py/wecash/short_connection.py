import websocket


access_token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzY3MDU3MjgsImlkIjoxMCwidXNlck5hbWUiOiJ5YXFpYW5nIn0.TRZPoUiJqAwk6j68Sv_h4GVnKRkdoMTCddumSLCzVpc"
wsUrl = "ws://10.119.13.16:10000/dct-business-api/ws/business?access_token="


ws = websocket.WebSocket()
ws.connect(wsUrl+access_token)
ws.send("mesasage")
ws.close()

