var p1 = new Person("孤傲苍狼",24,2300);
var p2 = new Person("白虎神皇",24,2300);
document.write("<pre>");
document.writeln("p1 instanceof Person的结果是："+(p1 instanceof Person));//p1是Person类的实例，结果是true
document.writeln("p2 instanceof Person的结果是："+(p2 instanceof Person));//p2是Person类的实例，结果是true
//当==两边的内容是对象或者是对象的函数属性时，则比较内存地址是否相等
document.writeln("当==两边的内容是对象或者是对象的函数属性时，则比较内存地址是否相等");
document.writeln("比较p1和p2这两个对象的show方法的内存地址是否一样：p1.show== p2.show的结果是："+(p1.show == p2.show));//false
document.writeln("p1.show == p2.show的结果是："+(p1.show == p2.show)+"，这证明p1对象和p2对象不是共享一个show方法，在内存中show方法的代码有2份，存放在两块内存区域");
document.writeln("name是Person类定义的public属性，可以使用类的对象去直接访问类的public属性");
document.writeln("p1.name="+p1.name);//访问公有属性，这是可以正常访问的
document.writeln("age和salary是Person类定义的private属性，不能使用类的对象去直接访问类私有属性，这是访问不了的，结果都是undefined");
document.writeln("p1.age="+p1.age+"，"+"p1.salary="+p1.salary)//不能使用类的对象去直接访问类私有属性，这是访问不了的，结果都是undefined
p1.show();//调用类的公共函数，这次允许的
p1.publicMethod();//调用类的公共函数，这次允许的
p1.setAge(24);//使用public方法setAge方法为私有属性age赋值
document.writeln("使用public方法getAge方法获取私有属性age的值，p1.getAge()="+p1.getAge());//使用getAge方法获取私有属性age的值
//document.writeln("p1.privateFn()："+p1.privateFn()+"&nbsp;p1.privateFn2()："+p1.privateFn2());//不能使用类的对象去调用类的私有方法，这里会报错”对象不支持此属性或者方法
document.write("</pre>");