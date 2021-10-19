from socket import socket, AF_INET, SOCK_STREAM, SOL_SOCKET, SO_REUSEADDR
from selectors import DefaultSelector, EVENT_READ

selector = DefaultSelector()
pool = {}

def request(client_socket, addr):
    client_socket, addr = client_socket, addr
    def handle_request(key, mask):
        data = client_socket.recv(100000)
        if not data:
            client_socket.close()
            selector.unregister(client_socket)
            del pool[addr]
        else:
            client_socket.sendall(data)
    return handle_request

def recv_client(key, mask):
    sock = key.fileobj
    client_socket, addr = sock.accept()
    req = request(client_socket, addr)
    pool[addr] = req
    selector.register(client_socket, EVENT_READ, req)

def echo_server(address):
    sock = socket(AF_INET, SOCK_STREAM)
    sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
    sock.bind(address)
    sock.listen(5)
    selector.register(sock, EVENT_READ, recv_client)
    try:
        while True:
            events = selector.select()
            for key, mask in events:
                callback = key.data
                callback(key, mask)
    except KeyboardInterrupt:
        sock.close()

if __name__ == '__main__':
    echo_server(('',25000))
