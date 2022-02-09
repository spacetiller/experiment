import threading
import time


def read():
    i=0
    while True:
        print(i)
        i+=1
        time.sleep(1)

def write():
    while True:
        s=input()
        if s=='exit':
            break

if __name__ == '__main__':
    print('test begin...')
    
    tw=threading.Thread(target=write)
    tr=threading.Thread(target=read,daemon=True)
    tw.start()
    tr.start()

