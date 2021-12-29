import threading
import selectors  # 封装了select和epoll
import socket
import multiprocessing

class ChatServer:
    def __init__(self, ip="127.0.0.1", port=9997):
        self.addr = ip, port
        self.sock = socket.socket()  # 创建socket对象
        self.sock.setblocking(False)  # 设置为非阻塞
        self.event = threading.Event()
        self.s = selectors.DefaultSelector()  # 默认选取当前平台最优selector, 返回值为SelectorKey

    def start(self):
        self.sock.bind(self.addr)
        self.sock.listen()
        key = self.s.register(self.sock, selectors.EVENT_READ, self.accept)
        threading.Thread(target=self.select, name="select", daemon=True).start()  # 设置为daemon线程,主线程退出,这个线程也会退出
        self.acceptkey = key

    def select(self):
        while not self.event.is_set():  # WDNMD!!! 这里你在做什么????!!!注意是event.is_set(),不是直接event!!!
            events = self.s.select()  # windows下默认启用select, linux下默认启用epoll,,关注的是刚才已经被注册了的IO操作,如果就绪,也就是datagram已经来到,
            for key, mask in events:
                callback = key.data
                callback(key.fileobj)

    def accept(self, sock:socket.socket):
        client, addr = sock.accept()
        print("已连接", addr)
        client.setblocking(False)  # 设置为非阻塞
        self.s.register(client, selectors.EVENT_READ, self.recv)

    def recv(self, client:socket.socket):
        data = client.recv(1024)
        if data == b"quit" or data == b"":
            print("有人退出连接")
            self.s.unregister(client)
            client.close()
            return
        for key in self.s.get_map().values():
            # if key.data == self.recv:
            #     key.fileobj.send(data)
            if self.acceptkey != key:
                key.fileobj.send(data)

    def stop(self):  #退出意味着全面关闭与unregister刚才添加到
        self.event.set()
        l = []
        for i in self.s.get_map().values(): # get_map方法得到实际上是_fd_to_key的一种mapping映射类型数据结构
            l.append(i.fileobj)
        for fj in l:
            self.s.unregister(fj) # unregister里面涉及到discard方法
        self.s.close()
        self.sock.close()


def main():
    cs = ChatServer()
    cs.start()
    while True:
        cmd = input(">>").strip()
        if cmd == "quit":
            cs.stop()
            break
        print(threading.enumerate())
        print(multiprocessing.active_children())


if __name__ == "__main__":
    main()

