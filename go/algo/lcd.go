package main

import (
	"fmt"
//	"math"
)

func gcd(a int, b int) int{
	if b == 0 {
		return a
	}else{
		//g := gcd(b, int(math.Mod(a,b)))
		r := a%b
		//fmt.Println(r)
		g := gcd(b, r)
		return g
	}
}

func main() {
	//var q [100]int /* n 是一个长度为 10 的数组 */
	//var r [100]int /* n 是一个长度为 10 的数组 */
	//var i, j int
	
	var a,n int = 10,15
	fmt.Printf("GCD of %d and %d: %d\n", a, n, gcd(a,n))
}
