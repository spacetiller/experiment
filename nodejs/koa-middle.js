var koa = require('koa');
var app = new koa();

app.use(responseTime());
app.use(upperCase());

app.use(function* () {
  this.body = 'hello koa';
});

function responseTime() {
  return function* (next) {
    // record start time
    yield next;
    // set X-Response-Time head
  };
}

function upperCase() {
  return function* (next) {
    // do nothing
    yield next;
    // convert this.body to upper case
  };
}

app.listen(process.argv[2]);