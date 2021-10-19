import websocket


def on_message(ws, msg):
    print(msg)


def on_error(ws, error):
    print(error)


def on_open(ws):
    print("open")


def on_close(ws):
    print("close")


def on_ping(ws, pingMsg):
    ws._send_ping();


def on_pong(ws, pongMsg):
    print("pong")


access_token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzY3MDU3MjgsImlkIjoxMCwidXNlck5hbWUiOiJ5YXFpYW5nIn0.TRZPoUiJqAwk6j68Sv_h4GVnKRkdoMTCddumSLCzVpc"
wsUrl = "ws://10.119.13.16:10000/dct-business-api/ws/business?access_token="

websocket.enableTrace(True)
ws = websocket.WebSocketApp(wsUrl+access_token, on_message=on_message, on_error=on_error, on_close=on_close,
                            on_ping=on_ping, on_pong=on_pong)
ws.run_forever(ping_interval=30, ping_timeout=5)


