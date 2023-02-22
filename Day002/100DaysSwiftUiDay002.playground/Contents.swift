import Cocoa

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
var gameOver = false

print(gameOver)

gameOver.toggle()
print(gameOver)

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let numberApollo = 11
// let missionMessage = "Apollo " + number + " landed on the moon."
// let missionMessage = "Apollo " + String(numberApollo) + " landed on the moon."
let missionMessage = "Apollo \(number) landed on the moon"

print("5 x 5 is \(5 * 5)")

// CheckPoint 1

let tempInCelsius = 25.0
let tempInFahrenheit = ((tempInCelsius * 9) / 5) + 32
// ° -> option + shift + 8
print("Temp in Celsius: \(tempInCelsius)°")
print("Temp in Fahrenheit: \(tempInFahrenheit)°")
