import Cocoa

// How to create your own structs

struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

// struct Employee {
//    let name: String
//    var vacationRemaining: Int = 14
//
//    mutating func takeVacation(days: Int) {
//        if vacationRemaining > days {
//            vacationRemaining -= days
//            print("I'm going on vacation!")
//            print("Days remaining: \(vacationRemaining)")
//        } else {
//            print("Oops! There aren't enough days remaining.")
//        }
//    }
// }

// var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
// archer.takeVacation(days: 5)
// print(archer.vacationRemaining)
//
// let kane = Employee(name: "Lana Kane")
// let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

// How to compute property values dynamically

struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }

        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)

// How to take action when a property changes

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// How to create custom initializers

struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1 ... 99)
    }
}

let player = Player(name: "Megan R")
print(player.number)

struct Employee2 {
    var name: String
    var yearsActive = 0
}

extension Employee2 {
    init() {
        name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = Employee2(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee2()
