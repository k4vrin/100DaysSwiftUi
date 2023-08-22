//
//  HapticManager.swift
//  DiceRoller
//
//  Created by Mostafa Hosseini on 8/22/23.
//

import CoreHaptics
import Foundation

class HapticManager {
    private var engine: CHHapticEngine?

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
            
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(0.5))
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(0.5))
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0.1)
        events.append(event)
            
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern \(error.localizedDescription)")
        }
    }
}
