'use strict'
//ͨ��require��http�������������
var http = require('http');
//�����µ�http������
var server = http.createServer();
//ͨ��request�¼�����Ӧrequest����
server.on('request',function(req,res){
	res.writeHead(200,{'Content-Type':'text/plain'});
	res.end('hello, nodejs server\n');
});
server.listen('8081');
console.log('server hello running ...');
