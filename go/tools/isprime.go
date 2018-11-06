package main

import (
	"fmt"
	"bufio"
	"os"
	"strconv"
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
	scanner := bufio.NewScanner(os.Stdin)
	fmt.Println("Please input number to check prime:")
	// fmt.Scanf("%s %s", &firstName, &lastName) 
	scanner.Scan()
	nstr := scanner.Text()
	//var num int
	//var err error
	num64,err := strconv.ParseInt(nstr, 10, 64)
	if err != nil {
		fmt.Printf("error ParseInt\n")
	}
	num := int(num64)
	
	fmt.Printf("%d's factor: \n",num)
	phi := 0
	for i := 2;i< num; i++ {
		if num % i == 0{
			fmt.Printf("%d ",i)
			phi ++
		}
	}
	fmt.Println("")
	if phi == 0 {
		fmt.Printf("%d is prime\n",num)
	}else{
		fmt.Printf("%d is composite\n",num)
	}
}
