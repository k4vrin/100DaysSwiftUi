//
//  LocalNotification.swift
//  HotProspects
//
//  Created by Mostafa Hosseini on 8/3/23.
//

import SwiftUI
import UserNotifications

struct LocalNotification: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter
                    .current()
                    .requestAuthorization(
                        options: [.alert, .badge, .sound]
                    ) { success, err in
                        if success {
                            print("All set!")
                        } else if let error = err {
                            print(error.localizedDescription)
                        }
                    }
            }
            
            Button("Schedule Notification") {
                let contet = UNMutableNotificationContent()
                contet.title = "Feed the dogs"
                contet.subtitle = "They look hungry"
                contet.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: contet, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct LocalNotification_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotification()
    }
}
