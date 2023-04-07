//
//  ContentView.swift
//  Konversion
//
//  Created by Mostafa Hosseini on 4/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    @State private var inputTemp = Temperature.Celsius
    @State private var outputTemp = Temperature.Celsius
    var convertedTemp: Double {
        let input = Double(input) ?? 0.0
        var inputValue: Double {
            switch inputTemp {
            case .Celsius:
                return input
            case .Fahrenheit:
                return (input - 32) * (5/9)
            case .Kelvin:
                return input - 273.15
            }
        }
        var output: Double {
            switch outputTemp {
            case .Celsius:
                return inputValue
            case .Fahrenheit:
                return (inputValue * (9/5)) + 32
            case .Kelvin:
                return inputValue + 273.15
            }
        }
        return output
    }

    let temps: [Temperature] = [.Celsius, .Fahrenheit, .Kelvin]
    var body: some View {
        NavigationView {
            Form {
                // Input
                Section {
                    TextField("Enter Temperature", text: $input)
                }
                // Input Type
                Section {
                    Picker(
                        "Input Temperature",
                        selection: $inputTemp
                    ) {
                        ForEach(
                            temps,
                            id: \.self
                        ) { temp in
                            Text("\(temp.description)")
                        }
                    }
                }
                
                // Output Type
                Section {
                    Picker(
                        "Output Temperature",
                        selection: $outputTemp
                    ) {
                        ForEach(
                            temps,
                            id: \.self
                        ) { temp in
                            Text("\(temp.description)")
                        }
                    }
                }
                
                // Result
                Section {
                    Text(" \(convertedTemp)")
                } header: {
                    Text("Converted temperature")
                }
            }
            .navigationTitle("Konversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Temperature: CustomStringConvertible {
    var description: String {
        switch self {
        case .Celsius: return "Celsius"
        case .Fahrenheit: return "Fahrenheit"
        case .Kelvin: return "Kelvin"
        }
    }

    case Celsius, Fahrenheit, Kelvin
}
