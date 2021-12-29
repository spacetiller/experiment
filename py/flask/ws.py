# ws.py
from fastapi import FastAPI, WebSocket
from fastapi.middleware.cors import CORSMiddleware

ws = FastAPI()

# Your CORS
ws.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# websocket
@ws.websocket("/")
async def websocket_endpoint(websocket: WebSocket):
    await websocket.accept()

    while True:
        data = await websocket.receive_text()
        await websocket.send_text(f"Message text was: {data}")

