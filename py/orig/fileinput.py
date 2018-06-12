import fileinput
import sys

for line in fileinput.input("hello.py"):
    sys.stdout.write("-> ")
    sys.stdout.write(line)
