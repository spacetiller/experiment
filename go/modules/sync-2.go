package main

import (
    "fmt"
    "sync" // 空//的行可以注释掉
    "time"
)

func main() {
    var a = 0

    // 启动 100 个协程，需要足够大
    var lock sync.Mutex   //
    for i := 1; i < 100; i++ {
        go func(idx int) {
             lock.Lock()  //
             defer lock.Unlock() //
            a += 1
            fmt.Printf("goroutine %d, a=%d\n", idx, a)
        }(i)
    }

    // 等待 1s 结束主程序
    // 确保所有协程执行完
    time.Sleep(time.Second)
}
