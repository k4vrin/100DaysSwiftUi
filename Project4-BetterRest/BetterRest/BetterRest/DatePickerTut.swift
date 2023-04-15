//
//  DatePickerTut.swift
//  BetterRest
//
//  Created by Mostafa Hosseini on 4/15/23.
//

import SwiftUI

struct DatePickerTut: View {
    @State private var wakeUp = Date.now

    var body: some View {
        DatePicker(
            "Please enter a data",
            selection: $wakeUp,
            // only future dates
            in: Date.now...
//            displayedComponents: .hourAndMinute
        )
//        .labelsHidden()
        
    }
    
    func exampleDate() {
        let secondsInDay = 86400.0
        let tomorrow = Date.now.addingTimeInterval(secondsInDay)
        let rang = Date.now...tomorrow
        
    }
}

struct DatePickerTut_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerTut()
    }
}
