package main

import "fmt"

var zero int = 0

func main() {
	var one int = 1
	child := func() {
		var two int = 2
		fmt.Println(zero)
		fmt.Println(one)
		fmt.Println(two)
		//fmt.Println(three) // causes compilation Error
	}
	child()
	var three int = 3
	three++
}
