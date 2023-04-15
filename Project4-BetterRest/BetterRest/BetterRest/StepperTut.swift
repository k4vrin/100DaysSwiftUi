//
//  StepperTut.swift
//  BetterRest
//
//  Created by Mostafa Hosseini on 4/15/23.
//

import SwiftUI

struct StepperTut: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper(
            "\(sleepAmount.formatted()) hours",
            value: $sleepAmount,
            in: 4...12,
            step: 0.25
        )
    }
}

struct StepperTut_Previews: PreviewProvider {
    static var previews: some View {
        StepperTut()
    }
}
