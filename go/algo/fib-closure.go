package main

import (
	"fmt"
	"math/big"
)

func fibonacci() func() *big.Int {
	v, s := big.NewInt(0), big.NewInt(1)
	return func() *big.Int {
		var tmp big.Int
		tmp.Set(s)
		s.Add(s, v)
		v = &tmp
		return s
	}
}
func main() {
	var r *big.Int
	f := fibonacci()
	for i := 0; i < 10000; i++ {
		r = f()
	}
	fmt.Println(r)
}
