package main

import ( 
	"fmt"
	"unsafe"
)

type S struct{}

func (s *S) addr(){ fmt.Printf("addr: %p\n",s) }

func main(){
	var x [1000000000]struct{}
	fmt.Println(unsafe.Sizeof(x)) // prints 0

	y := make([]struct{}, 1000000000)
	fmt.Println(unsafe.Sizeof(y)) // prints 12 in the playground
	fmt.Println(len(y), cap(y)) // prints 50 100

	//z := struct{}
	z1 := struct{}{}
	z2 := struct{}{}
	fmt.Println(unsafe.Sizeof(z1))
	fmt.Println(z1 == z2)

	var a,b S
	a.addr()
	b.addr()
}
