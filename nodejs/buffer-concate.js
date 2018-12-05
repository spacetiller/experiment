var buffer1 = Buffer.from(('数鸭子\n'));
var buffer2 = Buffer.from(('门前大桥下，游过一群鸭'));
var buffer3 = Buffer.concat([buffer1,buffer2]);
console.log("buffer3 内容: \n" + buffer3.toString());

