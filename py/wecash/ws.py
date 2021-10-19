import websocket


def on_message(ws, msg):
    print(msg)


def on_error(ws, error):
    print(error)


def on_open(ws):
    print("open")


def on_close(ws, other1, other2):
    print("close")


def on_ping(ws, pingMsg):
    ws._send_ping();


def on_pong(ws, pongMsg):
    print("pong")


access_token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzcyMTc4MTQsImlkIjoxMSwidXNlck5hbWUiOiJ6aGFuZ2h1aSJ9.vZnh8SC6MYGyVFdDtalsc9aSNR_ctNSiMPyFL0VY_V0"
wsUrl = "ws://10.119.13.16:10000/dct-business-api/ws/business?access_token="
#wsUrl = "ws://dct-test001.novadax.com/dct-business-api/ws/business?access_token="

websocket.enableTrace(True)
#ws = websocket.create_connection(wsUrl+access_token, on_message=on_message, on_error=on_error, on_close=on_close,
#                            on_ping=on_ping, on_pong=on_pong)
ws = websocket.WebSocketApp(wsUrl+access_token, on_message=on_message, on_error=on_error, on_close=on_close,
                            on_ping=on_ping, on_pong=on_pong)
print("Connect")
ws.run_forever(ping_interval=10, ping_timeout=5)
#ws.send("hello")
#ws.send("ping")
#ws.send("log")
print("Sent")
print("Receiving...")
#result =  ws.recv()
#print("Received '%s'" % result)
