from inspect import signature

def foo(a:int):
    pass

sig = signature(foo)
print(sig)
print(sig.parameters)
for name,param in sig.parameters.items():
    print(name,param)

