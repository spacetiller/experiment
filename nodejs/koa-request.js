var koa = require('koa');
var app = new koa();

// logger

/*app.use(function *(next){
  var start = new Date;
  yield next;
  var ms = new Date - start;
  console.log('%s %s - %s', this.method, this.url, ms);
});

// response

app.use(function *(){
  this.body = 'Hello World';
});*/

var parse = require('co-body');

// in Koa handler
var body = yield parse(this);


// So far, we've only used strings as bodies. Koa supports the following types of bodies:
app.use(function* (next) {
  this.body = {
    message: 'this will be sent as a JSON response!'
  };
})

//When setting a stream as a body, Koa will automatically add error handlers so you don't have to worry about error handling.
/*
 var fs = require('fs');

 app.use(function* (next) {
   this.body = fs.createReadStream('some_file.txt');
   // koa will automatically handle errors and leaks
 })
*/



app.listen(8081);