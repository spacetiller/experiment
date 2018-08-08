package main

import (
    "fmt"
//    "strconv"
    "strings"
)

func main(){
	fmt.Println(strings.Contains("seafood","foo"))
	fmt.Println(strings.Contains("seafood",""))
	fmt.Println(strings.Contains("",""))

	s := []string{"ada", "bar", "cat"}
	fmt.Println(strings.Join(s,","))

	fmt.Println(strings.Index("chicken", "ken"))

	fmt.Println("ba" + strings.Repeat("na", 2))

	fmt.Println(strings.Replace("oink oink oink", "oink", "moo", 1))

	fmt.Printf("%q\n", strings.Split("a,b,c", ","))

	fmt.Printf("[%q]\n", strings.Trim(" !!! Achtung !!! ", "! "))

	fmt.Printf("Fields are: %q\n", strings.Fields("  foo bar  baz   "))


}
