import Cocoa

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// How to make one class inherit from another

class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}


class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

// How to add initializers for classes

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

// How to copy classes

class User {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1
user2.username = "Taylor"

print(user1.username) // Taylor
print(user2.username) // Taylor

var user3 = user1.copy()
user1.username = "John"

print(user1.username) // John
print(user3.username) // Taylor

// How to create a deinitializer for a class

class User2 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [User2]()

for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

class User3 {
    var name = "Paul"
}

let user = User3()
user.name = "Taylor"
print(user.name)

// Checkpoint 7

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func speak() {}
}

class Dog : Animal {
    override func speak() {
        print("Bark bark")
    }
}

class Cat : Animal {
    let isTame: Bool
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    override func speak() {
        print("Meow")
    }
}

class Corgi : Dog {
    override func speak() {
        print("I'm a corgi bark bark")
    }
}

class Poodle : Dog {
    override func speak() {
        print("I'm a poodle bark bark")
    }
}


class Persian : Cat {
    override func speak() {
        print("I'm a persian meow")
    }
}


class Lion : Cat {
    override func speak() {
        print("I'm a fucking lion")
    }
}
