//
//  ContentView.swift
//  BetterRest
//
//  Created by Mostafa Hosseini on 4/15/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle  = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }

    var body: some View {
        NavigationView {
            Form {
                
                Text("Recomended: \(wakeUp.formatted(date: .omitted, time: .shortened))")
                    .font(.largeTitle)
                
                
                Section {
                    DatePicker(
                        "Please enter a time",
                        selection: $wakeUp,
                        displayedComponents: .hourAndMinute
                    )
                    .labelsHidden()
                } header: {
                    Text("When do you want to wake up?")
                        .font(.headline)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper(
                        "\(sleepAmount.formatted()) hours",
                        value: $sleepAmount,
                        in: 4 ... 12,
                        step: 0.25
                    )
                }

                VStack(alignment: .leading, spacing: 10) {
//                    Text("Daily coffee intake")
//                        .font(.headline)
                    
                    Picker(
                        "Daily coffee intake",
                        selection: $coffeeAmount
                    ) {
                        ForEach(1 ... 20, id: \.self) { num in
                            Text(num == 1 ? "1 cup" : "\(num) cups")
                        }
                    }
                    .font(.headline)
                    
//                    Stepper(
//                        coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups",
//                        value: $coffeeAmount,
//                        in: 1 ... 20
//                    )
                }
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button(
                    "Calculate",
                    action: calculateBedtime
                )
            }
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK") {
                    
                }
            } message: {
                Text(alertMessage)
            }
        }
    }

    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents(
                [.hour, .minute],
                from: wakeUp
            )
            let hourInSeconds = (components.hour ?? 0) * 60 * 60
            let minuteInSeconds = (components.minute ?? 0) * 60

            let prediction = try model.prediction(
                wake: Double(hourInSeconds + minuteInSeconds),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )
            
            let sleepTime = wakeUp - prediction.actualSleep
            wakeUp = sleepTime
            
            alertTitle = "Your ideal bedtime is"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
        }
        showAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
