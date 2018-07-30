package main

import "fmt"

func sum(s []int, c chan int) {
	fmt.Println("in sum")
	sum := 0
	for _, v := range s {
		sum += v
	}
	c <- sum // send sum to c
}
func main() {
	s := []int{7, 2, 8, -9, 4, 0, 1}
	c := make(chan int)
	go sum(s[:len(s)/2], c)
	go sum(s[len(s)/2:], c)
	fmt.Println("wait")
	s1 := 0
	for i := 0; i < 10000000; i++ {
		s1 += i
	}
	fmt.Println("Big task finished:", s1)
	x, y := <-c, <-c // receive from c
	fmt.Println(x, y, x+y)
}
