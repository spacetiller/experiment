import std.random.*

func add(a: Int64, b: Int64, c!: Int64 = 1): Int64 {
    return a + b + c
}

func evenodd() {
    let number: Int8 = Random().nextInt8()
    println(number)
    if (number % 2 == 0) {
        println("偶数")
    } else {
        println("奇数")
    }
}

main(): Unit {
    // evenodd
    let x = 1
    let y = 2
    let r = add(x, y)
    println("The sum of x and y is ${r}")

    evenodd()
}