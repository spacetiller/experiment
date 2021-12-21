class Counter(object):

    def __init__(self, filename, characters):
        self._characters = characters
        self.index = -1

        self.list = []
        f = open(filename, 'r')
        for word in f.read().split():
            n = word.strip('!?.,;:()$%')
            n_r = n.rstrip()
            if len(n) == self._characters:
                self.list.append(n)

    def __iter__(self): # __iter()
        return self

    def __next__(self):
        try:
            self.index += 1
            yield self.list[self.index]

        except IndexError:
            raise StopIteration
            f.close()

if __name__ == "__main__":
    for word in Counter('agency.txt', 11):
        print("%s' " % word)

