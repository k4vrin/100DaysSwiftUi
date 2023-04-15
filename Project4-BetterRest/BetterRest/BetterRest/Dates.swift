//
//  Dates.swift
//  BetterRest
//
//  Created by Mostafa Hosseini on 4/15/23.
//

import SwiftUI

struct Dates: View {
    var body: some View {
        VStack {
            Text(
                Date.now,
                format: .dateTime.hour().minute()
            )
            Text(
                Date.now,
                // we say we want day month year but
                // iOS choose their order
                format: .dateTime.day().month().year()
            )
            Text(
                Date.now.formatted(
                    date: .long,
                    time: .omitted
                )
            )
        }
    }
    
    func trivialExample() {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = now...tomorrow
    }
    
    func eg2() {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date.now
    }
    
    func eg3() {
        let component = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = component.hour ?? 0
        let minutes = component.minute ?? 0
    }
    
}

struct Dates_Previews: PreviewProvider {
    static var previews: some View {
        Dates()
    }
}
