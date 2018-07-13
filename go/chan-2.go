package main

import "fmt"

func main() {
	c := make(chan int)
	defer close(c)
	go func() { c <- 3 + 4 }()
	i := <-c
	fmt.Println(i)

	c2 := make(chan int)
	c2 <- 10
	j := <-c2
	fmt.Println(j)
	close(c2)
}
