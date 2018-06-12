#!/usr/bin/python
# Filename: method.py

class Person:
    ''' Represents a human being
        esp. on Earth
    '''
    population = 0
    def __init__(self, name):
        '''Initializes the person's data.'''
        self.name = name
        print '(initializing %s) ' % self.name
        Person.population += 1
    def __del__(self):
        '''I am dying.'''
        print '%s says bye.' % self.name

        Person.population -= 1

        if Person.population <= 0:
            print 'I am the last one.'
        else:
            print 'There are still %d people left.' % Person.population
    def sayHi(self):
        '''Greeting by the person.

        Really, that's all it does.'''
        print 'Hello, My name is ', self.name
    def howMany(self):
        '''Prints the current population.'''
        if Person.population == 1:
            print 'I am the only person here.'
        else:
            print 'We have %d persons here.' % Person.population

p = Person('juncheng')
p.sayHi()
p.name = 'juncheng.jung'
p.population = 100
print p.name

swaroop = Person('Swaroop')
swaroop.sayHi()
swaroop.howMany()

kalam = Person('Abdul Kalam')
kalam.sayHi()
kalam.howMany()

swaroop.sayHi()
swaroop.howMany()


