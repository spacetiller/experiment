package main

import "fmt"

func main() {
	c := make(chan int)
	defer close(c)
	go func() { c <- 3 + 4 }()
	i := <-c
	fmt.Println(i)

	c2 := make(chan string)
	go func() { c2 <- "hi" }()
	//c2 <- "hello"	// fatal error: all goroutines are asleep - deadlock!
	j := <-c2
	fmt.Println(j)
	close(c2)
}
