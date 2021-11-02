import websocket
import _thread


def on_message(ws, msg):
    print("on_message: "+msg)


def on_error(ws, error):
    print(error)


def on_open(ws):
    globalWs = ws


def on_close(ws, aa, bb):
    print("close")


def on_ping(ws, pingMsg):
    print("ping")


def on_pong(ws, pongMsg):
    print("pong")


import ssl

ssl._create_default = ssl._create_unverified_context

lws = None

access_token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzY3MDU3MjgsImlkIjoxMCwidXNlck5hbWUiOiJ5YXFpYW5nIn0.TRZPoUiJqAwk6j68Sv_h4GVnKRkdoMTCddumSLCzVpc"
#wsUrl = "ws:///dct-business-api/ws/business?access_token="
wsUrl = "wss://dct-test001-internal.wecash.net/dct-service-abquant/ws/business?access_token="

websocket.enableTrace(True)
lws = websocket.WebSocketApp(wsUrl + access_token, on_message=on_message, on_error=on_error, on_close=on_close,on_open=on_open,
                             on_ping=on_ping, on_pong=on_pong)
lws.run_forever(ping_interval=10, ping_timeout=5)


