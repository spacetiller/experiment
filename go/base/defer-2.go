package main

import "fmt"

func a() {
	i := 0
	defer fmt.Println(i) // print 0 because Rule#1: the parameter of defer is resolved real-time
	i++
	return
}

func main() {
	a()
}
