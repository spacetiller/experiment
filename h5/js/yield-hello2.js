function* bar() {
  yield 'x';
  yield* foo();
  yield 'y';
}
/*
// ��ͬ��
function* bar() {
  yield 'x';
  yield 'a';
  yield 'b';
  yield 'y';
}

// ��ͬ��
function* bar() {
  yield 'x';
  for (let v of foo()) {
    yield v;
  }
  yield 'y';
}
*/
for (let v of bar()){
  console.log(v);
}
// "x"
// "a"
// "b"
// "y"