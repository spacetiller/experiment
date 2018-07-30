package main

func main() {
	ack := make(chan bool, N)
	workers := Workers(func(a int) { // Point #2
		Task(a)
		ack <- true // Point #1
	})
	for i := 0; i < N; i++ {
		workers <- i
	}
	for i := 0; i < N; i++ { // Point #3
		<-ack
	}
}
