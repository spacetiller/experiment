function* _testYieldExpression(){
    let value = '';
    value = yield 'yield value';
    console.info(`1 value is: ${value}`);//输出1

    value = yield 'yield value';
    console.info(`2 value is: ${value}`);//输出2
    return 'over';
}

let _testIterator = _testYieldExpression();
let _res = _testIterator.next();
console.info(`1:no params to next, result is: ${_res.value}`);//输出3

_res = _testIterator.next('params from next');
console.info(`2:params to next, result is: ${_res.value}`);//输出4

_res = _testIterator.next();
console.info(`3:params to next, result is: ${_res.value}`);//输出5


function* g3() {
  yield* [1, 2];
  yield* '34';
  yield* Array.from(arguments);
}

var iterator = g3(5, 6);

console.log(iterator.next()); // {value: 1, done: false}
console.log(iterator.next()); // {value: 2, done: false}
console.log(iterator.next()); // {value: "3", done: false}
console.log(iterator.next()); // {value: "4", done: false}
console.log(iterator.next()); // {value: 5, done: false}
console.log(iterator.next()); // {value: 6, done: false}
console.log(iterator.next()); // {value: undefined, done: true}
