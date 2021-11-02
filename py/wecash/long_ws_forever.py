import websocket
import time
import _thread
from threading import Thread

wsClient = None


class Transmitter:

    client = None
    username = None
    password = None
    _pp_thread = None

    def __init__(self):
        client = None
        username = None
        password = None

    def on_message(self, ws, msg):
        print(msg)

    def on_error(self, ws, error):
        print(error)

    def on_open(self, ws):
        global wsClient
        wsClient = ws
        self.client = ws
        print("open")

    def on_close(self, ws, aa, bb):
        print("close")

    def on_ping(self, ws, pingMsg):
        print("ping")

    def on_pong(self, ws, pongMsg):
        print("pong")

    def run_forever(self, ws):
        ws.run_forever(ping_interval=10, ping_timeout=5)

    def connect_ws(self):
        # access_token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mzc4MjY0NjQsImlkIjoxMSwidXNlck5hbWUiOiJ6aGFuZ2h1aSJ9.Qik6IVIVSd_WA2jFvK2Yv-2WNlBAfOArJTjVnvMslvE"
        access_token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MzY3MDU3MjgsImlkIjoxMCwidXNlck5hbWUiOiJ5YXFpYW5nIn0.TRZPoUiJqAwk6j68Sv_h4GVnKRkdoMTCddumSLCzVpc"
        # wsUrl = "ws://10.119.13.16:10000/dct-business-api/ws/business?access_token="
        wsUrl = "wss://dct-test001-internal.wecash.net/dct-service-abquant/ws/business?access_token="

        websocket.enableTrace(False)
        ws = websocket.WebSocketApp(wsUrl + access_token, on_message=self.on_message, on_error=self.on_error,
                                    on_close=self.on_close, on_open=self.on_open,
                                    on_ping=self.on_ping, on_pong=self.on_pong)

        # ws.run_forever(ping_interval=10, ping_timeout=5)
        # _thread.start_new_thread(run_forever, (ws,))
        self._pp_thread = Thread(target=self.run_forever, args=(ws,))
        self._pp_thread.start()
        time.sleep(2)
        self.client = ws


if __name__ == '__main__':
    tx = Transmitter()
    tx.connect_ws()
    for i in range(10):
        # wsClient.send(f'client message {i}')
        tx.client.send(f'client message {i}')
        time.sleep(1)
