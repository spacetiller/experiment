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
    fmt.Println(strings.Contains("abbccddd", "cd")) //�ַ���s���Ƿ����substr������boolֵ
    fmt.Println(strings.Contains("aa", ""))
    fmt.Println(strings.Join([]string{"sqn", "hello", "world"}, " - ")) //�ַ������ӣ���slice aͨ��sep��������
    fmt.Println(strings.Index("aabcddae", "a")) //���ַ���s�в���sep���ڵ�λ�ã�����λ��ֵ���Ҳ�������-1
    fmt.Println(strings.Repeat("SQN", 5)) //�ظ�s�ַ���count�Σ���󷵻��ظ����ַ���
    fmt.Println(strings.Replace("ababababababab", "ab", "sqn", 5)) //��s�ַ����У���old�ַ����滻Ϊnew�ַ�����n��ʾ�滻�Ĵ�����С��0��ʾȫ���滻
    fmt.Println(strings.Replace("ababababababab", "ab", "sqn", 35))
    fmt.Println(strings.Split("sqn-sqn-sqn.sq-.sqn", "-")) //��s�ַ�������sep�ָ����slice
    fmt.Println(strings.Trim("sqnfewfewsqn", "sqn")) //��s�ַ�����ͷ����β��ȥ��cutsetָ�����ַ���
    fmt.Println(strings.Join(strings.Fields("a b sqn hello world sqn"), "***")) //ȥ��s�ַ����Ŀո�������Ұ��տո�ָ��slice,������
    /*�ַ���ת���ĺ�����strconv��*/
    //Append ϵ�к�����������ת��Ϊ�ַ�������ӵ����е��ֽ������С�
    str := make([]byte, 0, 100)
    str = strconv.AppendInt(str, 4444, 10) //10����
    str = strconv.AppendInt(str, 55555, 2) //2����
    str = strconv.AppendBool(str, false)
    str = strconv.AppendQuote(str, "abcdefg")
    str = strconv.AppendQuoteRune(str, '��')
    str = strconv.AppendQuoteRune(str, '��')
    fmt.Println(string(str))

    //Format ϵ�к������������͵�ת��Ϊ�ַ���Go
    a := strconv.FormatBool(false)
    b := strconv.FormatFloat(123.23, 'g', 12, 64)
    c := strconv.FormatInt(1234, 10)
    d := strconv.FormatUint(12345, 10)
    e := strconv.Itoa(1023)
    fmt.Println(a, b, c, d, e)

    //Parse ϵ�к������ַ���ת��Ϊ��������
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