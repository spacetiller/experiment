var express = require('express'); // expressģ�� ����ʹ�� npm install -g express  
var qs = require("querystring"); // querystringģ�� ����ʹ�� npm install -g express ���ڴ������Ĳ�����  
var mysql = require('mysql'); // mysqlģ�� ͬ������ʹ�� npm install -g mysql ��ȫ������  
var app = express();  
var pool = mysql.createPool({  
    host     : 'localhost',  // ������  
    port     : 3306, // ���ݿ����ӵĶ˿ں� Ĭ����3306  
    database : 'test', // ��Ҫ��ѯ�����ݿ�  
    user     : 'root', // �û���  
    password : '' // ���룬�ҵ������ǿա������ǿ��ַ���  
});  
app.post('/login',function (req,res) { // API������ַ��http://localhost:1337/login
    var body = "",data;  

    req.on('data', function(chunk) {  
        body += chunk;  
        console.log(body);  
    });  
    req.on('end', function() {  
        // ��������  
        data=qs.parse(body); // ����ֵ��ע�⣡querystring�е�pares�������԰�data�����ɶ��󣬹�����ʹ��  
        // ������Ӧͷ����Ϣ������  
        res.writeHead(200, {  
            'Content-Type': 'text/html;charset=utf8',  
            "Access-Control-Allow-Origin":"*" //*��ʾ�����������ַ��������Ϊ'http://localhost' ����Ӵ˲��� �ᱻ��Ϊ�ǿ���  
        });  
        if(data.username) { // ����ύ������  
            // ��������  
            pool.getConnection(function (err,connection) { // ʹ�����ӳ�  
                if(err){  
                    console.log('��MySQL���ݿ⽨������ʧ�ܣ�');  
                    console.log('������ϢΪ��' + err);  
                }  
                else{  
                    console.log('��MsSQL���ݿ⽨�����ӳɹ���');  
                    connection.query('INSERT INTO users SET ?',{  
                        username: data.username, // data.username ���� ��qs��������  
                        firstname: data.firstname // data.firstname ���� ��qs��������  
                    },function (err,result) {  
                        if(err){  
                            console.log('��������ʧ��');  
                            res.end('{code:2}'); // ͬʱҪע�ⷵ�ص�����Ҫ��json��������ͬ  
                            connection.release(); // �ͷ����ӳص����ӣ���Ϊ���ӳ�Ĭ�������������10��������������10 �򲻻���ͻ������ӣ��ͻ��˵�����Ҳ����Ϊ��ʱ���޷�Ӧ���������ճ�������ͼ  
                        }  
                        else{  
                            console.log('�������ݳɹ�');  
                            res.end('{code:1}');  
                            connection.release(); // �ͷ����ӳص�����  
                        }  
                    })  
                }  
            });  
        } else {   
            res.end('{code:0}'); // �����ֵΪ��ʱ����ִ�в������  
        }  
    })  
});  
app.listen(1337,'localhost'); 
