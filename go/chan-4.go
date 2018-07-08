package main

import "fmt"

var counts int = 0

func Count() {
	counts++
	fmt.Println(counts)
}
func main() {

	for i := 0; i < 3; i++ {
		go Count()
	}
}
