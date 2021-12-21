import threading,time

def light():
    count = 0
    while True:
        if count < 10:
            event.set()           #设置标志位
            print("\033[42;1m ---green light is on \033[0m")
            count += 1
        elif count < 15:    
            event.clear()        #清除标志位
            print("\033[41;1m ---red light is on \033[0m")
            count += 1
        else:
            count  = 0
        time.sleep(1)

def car(n):
    while True:
        if event.is_set():     #如果标志位设立了（即绿灯），那么车子就通行
            print("car[ %s ] is running..." % n)
        else:      #如果标志位没有设立（即红灯），那么车子就不通行
            print("the car[ %s ] is waiting for red light..." % n )
        time.sleep(2)

event = threading.Event()

t1 = threading.Thread(target=light)

t1.start()

for i in range(3):
    t2 = threading.Thread(target=car,args=(i,))
    t2.start()


