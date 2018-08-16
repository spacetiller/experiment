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
    var memo string
    flag.StringVar(&memo, "memo", "", "the memory")
    flag.Parse()
    flag.Usage()
    fmt.Printf("src=%s, level=%d, memo=%s\n", src, *level, memo)
}
