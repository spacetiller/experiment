/*定义一个Person类*/
function Person(_name,_age,_salary){
    //Person类的公开属性，类的公开属性的定义方式是：”this.属性名“
    this.name=_name;
    //Person类的私有属性，类的私有属性的定义方式是：”var 属性名“
    var age=_age;//私有属性
    var salary=_salary;//私有属性

    /*定义私有属性Age的对外公开访问方法*/
    this.setAge = function(intAge) {
        age = intAge;
    }
    /*定义私有属性Age的对外公开访问方法*/
    this.getAge = function() {
        return age;
    }

    //定义Person类的公开方法(特权方法)，类的公开方法的定义方式是：”this.functionName=function(){.....}“
    this.Show=function(){
        document.writeln("在公开方法里面访问类的私有属性是允许的，age="+age+"\t"+"salary="+salary);//在公开方法里面访问类的私有属性是允许的
    }
    //公共方法
    this.publicMethod = function(){
        document.writeln("在公开方法里面访问类的私有方法是允许的");
        privateFn();//在公开方法里面调用类的私有方法
        privateFn2();//在公开方法里面调用类的私有方法
    }
    /*
    定义Person类的私有方法(内部方法)，
    类的私有方法的定义方式是：”function functionName(){.....}“，
    或者 var functionName=function(){....}
    */
    function privateFn(){
        document.writeln("我是Person类的私有函数privateFn");
    }

    var privateFn2=function(){
        document.writeln("我是Person类的私有函数privateFn2");
    }
}