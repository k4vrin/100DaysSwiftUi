//
//  UseCoreHaptics.swift
//  Flashzilla
//
//  Created by Mostafa Hosseini on 8/9/23.
//

import SwiftUI
import CoreHaptics

struct UseCoreHaptics: View {
    
    // State because we want to keep engine alive through content recreation
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        VStack {
            Text("Success")
                .onTapGesture(perform: simpleSuccess)
                .padding()
            Text("Warning")
                .onTapGesture(perform: simpleWarning)
                .padding()
            Text("Error")
                .onTapGesture(perform: simpleError)
                .padding()
            Text("Complex Success")
                .onTapGesture(perform: complexSuccess)
                .padding()
        }
        .onAppear(perform: prepareHaptics)
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: . hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: . hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }
        
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern \(error.localizedDescription)")
        }
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    func simpleWarning() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    func simpleError() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}

struct UseCoreHaptics_Previews: PreviewProvider {
    static var previews: some View {
        UseCoreHaptics()
    }
}
