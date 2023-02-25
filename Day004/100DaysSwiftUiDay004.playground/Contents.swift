import Cocoa

// type annotations

let surname: String = "Lasso"
var score: Int = 0
var score2: Double = 0

let playerName: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true
var albums: [String] = ["Red", "Fearless"]
var album2: Array<String> = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var user2: Dictionary<String, String> = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])


var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()


enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
var style2: UIStyle = .light


let username: String
// lots of complex logic
username = "@twostraws"
//username = "@avds"
// lots more complex logic
print(username)

//let score3: Int = "Zero"

// Challenge


let countries = ["Iran", "US", "France", "Spain", "Iran"]
print(countries.count)
print(Set(countries).count)

