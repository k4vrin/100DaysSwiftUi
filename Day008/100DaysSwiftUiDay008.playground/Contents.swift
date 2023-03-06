import Cocoa

//func printTimesTables(for number: Int, end: Int) {
//    for i in 1...end {
//        print("\(i) x \(number) is \(i * number)")
//    }
//}
//
//printTimesTables(for: 5, end: 20)

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)


var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

// Checkpoint 4
enum sqrError: Error {
    case outOfBound, noRoot
}
func squareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw sqrError.outOfBound
    }
    
    for i in 1...(min(number/2, 100)) {
        if number / i == i {
            return i
        }
    }
    throw sqrError.noRoot
}

let num = 33
do {
    print(try squareRoot(of: num))
} catch sqrError.outOfBound {
    print("error: out of bound")
}catch sqrError.noRoot {
    print("error: no root")
} catch {
    print("error: \(error.localizedDescription)")
}
