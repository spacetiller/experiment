package main
 
import (
	"fmt"
	"math"
	"math/big"
)
 
func main() {
	// Here are some calculations with bigInts:
	im := big.NewInt(math.MaxInt64)
	in := im
	io := big.NewInt(1956)
	ip := big.NewInt(1)
	ip.Mul(im, in)
	fmt.Printf("Big Int: %v\n", ip)
	ip.Add(ip, im)
	fmt.Printf("Big Int: %v\n", ip)
	ip.Div(ip, io)
	fmt.Printf("Big Int: %v\n", ip)
	iq := big.NewInt(10000)
	ip.Mod(ip, iq)
	fmt.Printf("Big Int: %v\n", ip)
}
