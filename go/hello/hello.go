package main

import (
	"fmt"
	"example/greetings"
)

func main() {
    fmt.Println("Hello, World!")
	message := greetings.Hello("Jason")
    fmt.Println(message)
}
