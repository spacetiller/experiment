class TestIterator:

    value = 0

    def __next__(self):

        self.value += 1

        if self.value > 10: raise StopIteration

        return self.value

    def __iter__(self):

        return self



ti = TestIterator()

for i in ti:   

    if i < 5:

        print(i)

        if i == 4: break



###迭代器如果没有走到最后，下一次将从上次停止的地方开始

print("xxx")    

for i in ti:   
    print(i)

