import websocket
import time
import _thread

wsClient = None

def on_message(ws, msg):
    print(msg)


def on_error(ws, error):
    print(error)


def on_open(ws):
    global wsClient
    wsClient = ws
    print("open")


def on_close(ws, aa, bb):
    print("close")


def on_ping(ws, pingMsg):
    ws._send_ping();


def on_pong(ws, pongMsg):
    print("pong")

def run_forever(ws):
    ws.run_forever(ping_interval=10, ping_timeout=5)

access_token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mzc4MDg5NjUsImlkIjoxMSwidXNlck5hbWUiOiJ6aGFuZ2h1aSJ9.Bvb3Zlpxt6FzgMWub-DJRSNCTIdV_6l9w5qCuRbtU-s"
#wsUrl = "ws://10.119.13.16:10000/dct-business-api/ws/business?access_token="
wsUrl = "wss://dct-test001-internal.wecash.net/dct-service-abquant/ws/business?access_token="

websocket.enableTrace(True)
ws = websocket.WebSocketApp(wsUrl+access_token, on_message=on_message, on_error=on_error, on_close=on_close,
                            on_ping=on_ping, on_pong=on_pong)

#ws.run_forever(ping_interval=30, ping_timeout=5)
#_thread.start_new_thread(run_forever, (ws,))
_thread.start_new_thread(run_forever, (ws,))

time.sleep(2)

for i in range(10):
    wsClient.send('client message ' + i)
    time.sleep(1)

