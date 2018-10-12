package main

import (
   "fmt"
)

func test1(x *int){
    fmt.Printf("%p, %v\n",&x ,x)
}

func main(){
    a := 0x100
    p := &a
    fmt.Printf("%p, %v\n", &p, p)
    test1(p)
}
