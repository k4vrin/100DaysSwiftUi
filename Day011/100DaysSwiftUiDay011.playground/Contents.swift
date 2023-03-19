import Cocoa

// How to limit access to internal data using access control
struct BankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

// account.funds -= 1000

// Static properties and methods

enum School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

enum AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

// Checkpoint 6

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int

    mutating func changeGear(to gear: Int) -> Bool {
        if !(1 ... 10).contains(gear) {
            return false
        }
        currentGear = gear
        return true
    }
}

var benz = Car(model: "Benz", numberOfSeats: 5, currentGear: 1)
benz.changeGear(to: 5)
print(benz.currentGear)
