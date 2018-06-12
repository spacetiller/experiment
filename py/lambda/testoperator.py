from operator import *


a = 3
b = 5

print 'not_(a)   :', not_(a)
print 'truth(a)   :', truth(a)
print 'is_(a, b)  :', is_(a, b)
print 'is_not(a, b) :', is_not(a, b)

print 'a =', a
print 'b =', b
print
for func in (lt, le, eq, ne, ge, gt):
  print '{0}(a, b):'.format(func.__name__), func(a, b)


#others: abs(), neg(), pos(),


a = -2
b = 5.0
 
print 'a =', a
print 'b =', b
  
print '\nArithmetic'
print 'add(a, b)    :', add(a, b)
print 'div(a, b)    :', div(a, b)
print 'floordiv(a, b)  :', floordiv(a, b)
print 'mod(a, b)    :', mod(a, b)
print 'mul(a, b)    :', mul(a, b)
print 'pow(a, b)    :', pow(a, b)
print 'sub(a, b)    :', sub(a, b)
print 'truediv(a, b)  :', truediv(a, b)


a = 2
b = 6
 
print 'a =', a
print 'b =', b
 
print '\nBitwise:'
print 'and_(a, b)  :', and_(a, b)
print 'invert(a)  :', invert(a)
print 'lshift(a, b) :', lshift(a, b)
print 'or_(a, b)  :', or_(a, b)
print 'rshift(a, b) :', rshift(a, b)
print 'xor(a, b)  :', xor(a, b)


c = [1, 2]
d = ['a', 'b']

a = iadd(a, b)
print 'a = iadd(a, b) =>', a
c = iconcat(c, d)
print 'c = iconcat(c, d) =>', c





class MyObj(object):
  def __init__(self, arg):
    super(MyObj, self).__init__()
    self.arg = arg
  def __repr__(self):
    return 'MyObj(%s)' % self.arg
 
objs = [MyObj(i) for i in xrange(5)]
print "Object:", objs
 
g = attrgetter("arg")
vals = [g(i) for i in objs]
print "arg values:", vals
 
objs.reverse()
print "reversed:", objs
print "sorted:", sorted(objs, key=g)




class NoType(object):
  pass
 
class MultiType(object):
  def __len__(self):
    return 0
 
  def __getitem__(self, name):
    return "mapping"
 
  def __int__(self):
    return 0
 
o = NoType()
t = MultiType()
 
for func in [isMappingType, isNumberType, isSequenceType]:
  print "%s(o):" % func.__name__, func(o)
  print "%s(t):" % func.__name__, func(t)



# test lambada
g = lambda x:x+1
g(5)

foo = [2, 18, 9] #22, 17, 24, 8, 12, 27
print filter(lambda x: x % 3 == 0, foo)
print map(lambda x: x * 2 + 10, foo)
print reduce(lambda x, y: x + y, foo)	