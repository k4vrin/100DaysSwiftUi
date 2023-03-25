import Cocoa

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1

    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1

    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)

let car = Car()
commute(distance: 100, using: car)

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

getTravelEstimates(using: [car, bike], distance: 150)

// How to use opaque return types

func getRandomNumber() -> some Equatable {
    Int.random(in: 1 ... 6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

// How to create and use extensions

var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    mutating func trim() {
        self = self.trimmed()
    }

    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

let trimmed2 = quote.trimmed()
quote.trim()

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)
let lotr2 = Book(title: "Lord of the Rings", pageCount: 1178)

// How to create and use protocol extensions

let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// Checkpoint 8

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var estateAgent: String { get }
    func printSalesSummary()
}

extension Building {
    func printSalesSummary() {
        print("\(rooms) house sold by \(estateAgent) for total amount of \(cost)$")
    }
}

struct House: Building {
    let rooms: Int
    let cost: Int
    let estateAgent: String
}

struct Office: Building {
    let rooms: Int
    let cost: Int
    let estateAgent: String
}

// Get the most from protocol extensions

extension Numeric {
    func squared() -> Self {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())

struct User: Comparable {
    let name: String
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}

let user1 = User(name: "Link")
let user2 = User(name: "Zelda")

print(user1 == user2)
print(user1 != user2)
print(user1 < user2)
print(user1 > user2)
