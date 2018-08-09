package main

import (
    "fmt"
    "strconv"
    "strings"
	"regexp"
)

func checkError(e error) {
    if e != nil {
        fmt.Println(e)
    }
}

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

	str := make([]byte, 0, 100)
	str = strconv.AppendInt(str, 4567, 10) //以10进制方式追加
	fmt.Println(str)

    x := strconv.FormatBool(false)
    y := strconv.FormatInt(1234, 10)
    z := strconv.FormatUint(12345, 10)
    w := strconv.Itoa(1023)
    fmt.Println(x, y, z, w) //false 1234 12345 1023

    a, err := strconv.ParseBool("false")
    checkError(err)
    b, err := strconv.ParseFloat("123.23", 64)
    checkError(err)
    c, err := strconv.ParseInt("1234", 10, 64)
    checkError(err)
    d, err := strconv.ParseUint("12345", 10, 64)
    checkError(err)
    e, err := strconv.Atoi("1023")
    checkError(err)
    fmt.Println(a, b, c, d, e) //false 123.23 1234 12345 1023	
}
