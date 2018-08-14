package main

import "fmt"

type Cat interface {
  Meow()
}

type Tabby struct {}
func (*Tabby) Meow() { fmt.Println("meow") }

func GetACat() Cat {
  var myTabby *Tabby = nil
  // Oops, we forgot to set myTabby to a real value
  return myTabby
}

func main() {
  if GetACat() == nil {
    fmt.Println("Forgot to return a real cat!")
  }else{
    fmt.Println("GetACat() return no nil")
  }
}
