#!/usr/bin/env python3
""" Two shoppers adding items to a shared notepad """

import threading

garlic_count = 0
#pencil = threading.Lock()

def shopper():
    global garlic_count
    for i in range(10000000):
        #pencil.acquire()
        garlic_count += 1
        #pencil.release()

if __name__ == '__main__':
    barran = threading.Thread(target=shopper)
    olivia = threading.Thread(target=shopper)
    barran.start()
    olivia.start()
    barran.join()
    olivia.join()
    print('We should buy', garlic_count, 'garlic.')
