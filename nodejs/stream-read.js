var fs = require("fs");
var data = '';
var i = 0;

// 创建可读流
var readerStream = fs.createReadStream('shanhaijing.txt');

// 设置编码为 utf8。
readerStream.setEncoding('UTF8');

// 处理流事件 --> data, end, and error
readerStream.on('data', function(chunk) {
   data += chunk;
   i ++;
   console.log(i);
   console.log(data.length);
   //console.log(data);
});

readerStream.on('end',function(){
   console.log(data);
});

readerStream.on('error', function(err){
   console.log(err.stack);
});

console.log("程序执行完毕");




