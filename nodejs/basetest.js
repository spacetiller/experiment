var express = require('express');
var app = express();
app.listen(5000);
console.log('Server listening on 5000');

var BaseResult = require('./base');

BaseResult.SUCCESS.setData({a:10,b:[{c:20,d:30},{e:40,f:50}]});
app.get('/',function(req,res){
    res.send(BaseResult.SUCCESS);
});

//BaseResult.USER_PASSWORD_ERROR.setData();
app.post('/user',function(req,res){
    res.send(BaseResult.USER_PASSWORD_ERROR);
})

