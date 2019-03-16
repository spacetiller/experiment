var hello = require('./module-hello');
hello.world();

var Hello = require('./module-hello2'); 
hello = new Hello(); 
hello.setName('BYVoid'); 
hello.sayHello(); 