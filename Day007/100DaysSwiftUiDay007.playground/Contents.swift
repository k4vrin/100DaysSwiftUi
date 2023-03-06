import Cocoa

print("Welcome to my app!")
print("By default This prints out a conversion")
print("chart from centimeters to inches, but you")
print("can also set a custom range if you want.")

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

func printTimesTables(number: Int, end: Int) {
    for i in 1 ... end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)

func doesHaveSameLetters(first: String, second: String) -> Bool {
    let firstStrOrdered = first.sorted()
    let secondStrOrdered = second.sorted()

    return firstStrOrdered == secondStrOrdered
}

print(doesHaveSameLetters(first: "abc", second: "cab"))

func doesHaveSameLetters2(first: String, second: String) -> Bool {
    first.sorted() == second.sorted()
}



func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a*a+b*b)
}
print(pythagoras(a: 3, b: 4))

func dummyFunc() {
    return
}

//func greet(name: String) -> String {
//    if name == "Taylor Swift" {
//        return "Oh wow!"
//    } else {
//        return "Hello, \(name)"
//    }
//}

//func greet(name: String) -> String {
//    if name == "Taylor Swift" {
//        "Oh wow!"
//    } else {
//        "Hello, \(name)"
//    }
//}

func greet(name: String) -> String {
    name == "Taylor Swift" ? "Oh wow!" : "Hello, \(name)"
}


func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])")

func getUser2() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}

let user2 = getUser2()
print("Name: \(user2["firstName", default: "Anonymous"]) \(user2["lastName", default: "Anonymous"])")


func getUser3() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user3 = getUser3()
print("Name: \(user3.firstName) \(user3.lastName)")

func getUser4() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

func getUser5() -> (String, String) {
    ("Taylor", "Swift")
}

let user5 = getUser5()
print("Name: \(user5.0) \(user5.1)")


func getUser6() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user6 = getUser6()
let firstName = user6.firstName
let lastName = user6.lastName

print("Name: \(firstName) \(lastName)")


let (firstName2, lastName2) = getUser6()
print("Name: \(firstName2) \(lastName2)")

let (firstName3, _) = getUser6()
print("Name: \(firstName3)")


//func isUppercase(string: String) -> Bool {
//    string == string.uppercased()
//}
//
//let string = "HELLO, WORLD"
//let result = isUppercase(string: string)

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)

//func printTimesTables(number: Int) {
//    for i in 1...12 {
//        print("\(i) x \(number) is \(i * number)")
//    }
//}
//
//printTimesTables(number: 5)

//func printTimesTables(for: Int) {
//    for i in 1...12 {
//        print("\(i) x \(for) is \(i * for)")
//    }
//}
//
//printTimesTables(for: 5)

func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
