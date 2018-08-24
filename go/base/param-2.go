package main

import (
    "flag"
    "fmt"
)

func main() {
    var src string
    flag.StringVar(&src, "src", "", "source file")
    var level *int
    level = flag.Int("level", 0, "debug level")
    flag.Parse()
    flag.Usage()
    fmt.Printf("src=%s, level=%d\n", src, *level)
}
