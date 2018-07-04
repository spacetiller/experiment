package main

import "fmt"

type Books struct {
	title   string
	author  string
	subject string
	book_id int
}

func main() {
	var Book1 Books /* Declare Book1 of type Book */

	/* book 1 描述 */
	Book1.title = "Go 语言"
	Book1.author = "www.runoob.com"
	Book1.subject = "Go 语言教程"
	Book1.book_id = 6495407

	/* 修改 Book1 信息 */
	reviseBook(&Book1)

	/* 打印 Book1 信息 */
	printBook(&Book1)
}
func reviseBook(book *Books) {
	book.title = "Go 语言 （修订）"
	book.author = "www.runoob.com （修订）"
	book.subject = "Go 语言教程 （修订）"
	book.book_id = 6495408
}
func printBook(book *Books) {
	fmt.Printf("Book title : %s\n", book.title)
	fmt.Printf("Book author : %s\n", book.author)
	fmt.Printf("Book subject : %s\n", book.subject)
	fmt.Printf("Book book_id : %d\n", book.book_id)
}
