package main

import (
    "fmt"
    "strconv"
    "strings"
)

func checkError(e error) {
    if e != nil {
        fmt.Println(e)
    }
}

func main() {
    fmt.Println(strings.Contains("abbccddd", "cd")) //字符串s中是否包含substr，返回bool值
    fmt.Println(strings.Contains("aa", ""))
    fmt.Println(strings.Join([]string{"sqn", "hello", "world"}, " - ")) //字符串链接，把slice a通过sep链接起来
    fmt.Println(strings.Index("aabcddae", "a")) //在字符串s中查找sep所在的位置，返回位置值，找不到返回-1
    fmt.Println(strings.Repeat("SQN", 5)) //重复s字符串count次，最后返回重复的字符串
    fmt.Println(strings.Replace("ababababababab", "ab", "sqn", 5)) //在s字符串中，把old字符串替换为new字符串，n表示替换的次数，小于0表示全部替换
    fmt.Println(strings.Replace("ababababababab", "ab", "sqn", 35))
    fmt.Println(strings.Split("sqn-sqn-sqn.sq-.sqn", "-")) //把s字符串按照sep分割，返回slice
    fmt.Println(strings.Trim("sqnfewfewsqn", "sqn")) //在s字符串的头部和尾部去除cutset指定的字符串
    fmt.Println(strings.Join(strings.Fields("a b sqn hello world sqn"), "***")) //去除s字符串的空格符，并且按照空格分割返回slice,并连接
    /*字符串转化的函数在strconv中*/
    //Append 系列函数将整数等转换为字符串后，添加到现有的字节数组中。
    str := make([]byte, 0, 100)
    str = strconv.AppendInt(str, 4444, 10) //10进制
    str = strconv.AppendInt(str, 55555, 2) //2进制
    str = strconv.AppendBool(str, false)
    str = strconv.AppendQuote(str, "abcdefg")
    str = strconv.AppendQuoteRune(str, '单')
    str = strconv.AppendQuoteRune(str, '你')
    fmt.Println(string(str))

    //Format 系列函数把其他类型的转换为字符串Go
    a := strconv.FormatBool(false)
    b := strconv.FormatFloat(123.23, 'g', 12, 64)
    c := strconv.FormatInt(1234, 10)
    d := strconv.FormatUint(12345, 10)
    e := strconv.Itoa(1023)
    fmt.Println(a, b, c, d, e)

    //Parse 系列函数把字符串转换为其他类型
    a1, err := strconv.ParseBool("false")
    checkError(err)
    b1, err1 := strconv.ParseFloat("123.23", 64)
    checkError(err1)
    c1, err2 := strconv.ParseInt("1234", 10, 64)
    checkError(err2)
    d1, err3 := strconv.ParseUint("12345", 10, 64)
    checkError(err3)
    e1, err4 := strconv.Atoi("1023")
    checkError(err4)
    fmt.Println(a1, b1, c1, d1, e1)
    b3 := "1000"
    fmt.Println(string(b3))
    m := 6
    fmt.Println(int(m))
    fmt.Println(float32(m))
    fmt.Println(float64(m))
}