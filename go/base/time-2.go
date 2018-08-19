package main

import "time"
import "fmt"

//import "strconv"

func main() {
	fmt.Println("time ===============:")
	const base_format = "2006-01-02 15:04:05"
	//获取当前时间
	nt := time.Now()
	fmt.Printf("now datetime:%v\n", nt)
	
	
	//延时年月日
	adnt := nt.AddDate(1,2,3)
	fmt.Printf("now adddate:%v\n", adnt)
	
	
	//延时秒
	ant := nt.Add(3600*1e9) //延时1小时=60*60 秒
	fmt.Printf("now add:%v\n", ant)
	
	
	//转换为时间格式字符串
	str_time := nt.Format(base_format)
	fmt.Printf("now time string:%v\n", str_time)
	
	
	//时间字符串转换为日期格式
	parse_str_time, _ := time.Parse(base_format, str_time)
	fmt.Printf("string to datetime :%v\n", parse_str_time)
	
	
	//时间戳 秒
	timestamp := time.Now().Unix()
	println("timestamp:", timestamp)
	//时间戳 毫秒
	msec := time.Now().UnixNano() / 1e6
	println("timestamp msec:", msec)
	
	
	float_ms := msec % timestamp
	v := fmt.Sprintf("%.3f\n", float64(float_ms)/1000.0)
	println("float msec:", v)
	
	
	//时间戳转日期格式
	date_time := time.Unix(timestamp, 0)
	fmt.Printf("timestamp to datetime:%v\n", date_time)
	
	
	//时间字符串转时间戳
	t, _ := time.Parse(base_format, "2018-01-18 01:01:01")
	datetime_str_to_timestamp := t.Unix()
	println("datetime_str_to_timestamp:", datetime_str_to_timestamp)
}
