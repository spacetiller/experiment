from typing import List

from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.responses import HTMLResponse

app = FastAPI()


class ConnectionManager:
    def __init__(self):
        # 存放激活的ws连接对象
        self.active_connections: List[WebSocket] = []

    async def connect(self, ws: WebSocket):
        # 等待连接
        await ws.accept()
        # 存储ws连接对象
        self.active_connections.append(ws)
        print(len(self.active_connections))

    def disconnect(self, ws: WebSocket):
        # 关闭时 移除ws对象
        self.active_connections.remove(ws)

    @staticmethod
    async def send_personal_message(message: str, ws: WebSocket):
        # 发送个人消息
        await ws.send_text(message)

    async def broadcast(self, message: str):
        # 广播消息
        for connection in self.active_connections:
            await connection.send_text(message)


manager = ConnectionManager()

html = """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>聊天1</title>
    </head>
    <body>
    <h1>User1 Chat</h1>
    <form action="" onsubmit="sendMessage(event)">
        <input type="text" id="messageText" autocomplete="off"/>
        <button>Send</button>
    </form>
    <ul id='messages'>
    </ul>
    
    <script>
        var ws = new WebSocket("ws://127.0.0.1:8001/ws/user1");
    
        ws.onmessage = function(event) {
            var messages = document.getElementById('messages')
            var message = document.createElement('li')
            var content = document.createTextNode(event.data)
            message.appendChild(content)
            messages.appendChild(message)
        };
        function sendMessage(event) {
            var input = document.getElementById("messageText")
            ws.send(input.value)
            input.value = ''
            event.preventDefault()
        }
    </script>
    
    </body>
    </html>


"""


@app.get("/")
async def get():
    return HTMLResponse(html)


@app.websocket("/ws/{user}")
async def websocket_endpoint(websocket: WebSocket, user: str):
    print(len(manager.active_connections))

    await manager.connect(websocket)

    await manager.broadcast(f"用户{user}进入聊天室")

    try:
        while True:
            data = await websocket.receive_text()
            await manager.send_personal_message(f"你说了: {data}", websocket)
            await manager.broadcast(f"用户:{user} 说: {data}")

    except WebSocketDisconnect:
        manager.disconnect(websocket)
        await manager.broadcast(f"用户-{user}-离开")

if __name__ == "__main__":
    import uvicorn
    # 官方推荐是用命令后启动 uvicorn main:app --host=127.0.0.1 --port=8010 --reload
    uvicorn.run(app='chatroom_fastapi2:app', host="0.0.0.0", port=8001, reload=True, debug=True)


