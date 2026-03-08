package greetings

import "fmt"

// Hello 为指定的人返回问候语.
func Hello(name string) string {
    // 返回在消息中嵌入名称的问候语.
    message := fmt.Sprintf("Hi, %v. Welcome!", name)
    return message
}
