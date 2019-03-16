var express = require('express'); // express模块 可以使用 npm install -g express  
var qs = require("querystring"); // querystring模块 可以使用 npm install -g express 用于处理传来的参数串  
var mysql = require('mysql'); // mysql模块 同样可以使用 npm install -g mysql 来全局下载  
var app = express();  
var pool = mysql.createPool({  
    host     : 'localhost',  // 主机名  
    port     : 3306, // 数据库连接的端口号 默认是3306  
    database : 'test', // 需要查询的数据库  
    user     : 'root', // 用户名  
    password : '' // 密码，我的密码是空。所以是空字符串  
});  
app.post('/login',function (req,res) { // API完整地址：http://localhost:1337/login
    var body = "",data;  

    req.on('data', function(chunk) {  
        body += chunk;  
        console.log(body);  
    });  
    req.on('end', function() {  
        // 解析参数  
        data=qs.parse(body); // 这里值得注意！querystring中的pares方法可以吧data解析成对象，供下文使用  
        // 设置响应头部信息及编码  
        res.writeHead(200, {  
            'Content-Type': 'text/html;charset=utf8',  
            "Access-Control-Allow-Origin":"*" //*表示允许的域名地址，本地则为'http://localhost' 不添加此参数 会被认为是跨域  
        });  
        if(data.username) { // 输出提交的数据  
            // 插入数据  
            pool.getConnection(function (err,connection) { // 使用连接池  
                if(err){  
                    console.log('与MySQL数据库建立连接失败！');  
                    console.log('错误信息为：' + err);  
                }  
                else{  
                    console.log('与MsSQL数据库建立连接成功！');  
                    connection.query('INSERT INTO users SET ?',{  
                        username: data.username, // data.username 则是 由qs解析过的  
                        firstname: data.firstname // data.firstname 则是 由qs解析过的  
                    },function (err,result) {  
                        if(err){  
                            console.log('插入数据失败');  
                            res.end('{code:2}'); // 同时要注意返回的数据要是json对象，以下同  
                            connection.release(); // 释放连接池的连接，因为连接池默认最大连接数是10，如果点击数超过10 则不会与客户端连接，客户端的请求也会因为长时间无反应报错，下面会粘出报错的图  
                        }  
                        else{  
                            console.log('插入数据成功');  
                            res.end('{code:1}');  
                            connection.release(); // 释放连接池的连接  
                        }  
                    })  
                }  
            });  
        } else {   
            res.end('{code:0}'); // 传入的值为空时，不执行插入操作  
        }  
    })  
});  
app.listen(1337,'localhost'); 
