package main

var x, y int
var ( // 这种因式分解关键字的写法一般用于声明全局变量
	a int
	b bool
)

var c, d int = 1, 2
var e, f = 123, "hello"

//这种不带声明格式的只能在函数体中出现
//g, h := 123, "hello"

const (
	i = 1 << iota
	j = 3 << iota
	k
	l
)

func main() {
	g, h := 123, "hello"
	c++
	var m = c + 2
	var p *int = &c

	println(x, y, a, b, c, d, e, f, g, h, l, m, *p)
	println(&x, &g)
}
