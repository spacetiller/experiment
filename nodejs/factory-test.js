var express = require('express');
var app = express();
app.listen(5000);
console.log('Server listening on 5000');

var createCar = require('./factory-2');

app.get('/',function(req,res){
	var oCar1 = createCar("red",4,23);
	var oCar2 = createCar("blue",3,25);

	oCar1.showColor();		//输出 "red"
	oCar2.showColor();		//输出 "blue"
    res.send(oCar1.color);
});

