// Lesson 11
//
//  SwiftUILocalNotifications.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    
    static let instance = NotificationManager() //Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "This is my First Notification!"
        content.subtitle = "This was so easy"
        content.sound = .default
        content.badge = 1
        
        // time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // calender
//        var DateComponents = DateComponents()
//        DateComponents.hour = 10
//        DateComponents.minute = 35
//        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: DateComponents, repeats: true)
        
        // location
//        let cords: CLLocationCoordinate2D = CLLocationCoordinate2D(
//            latitude: 36.41,
//            longitude: 108.4
//        )
//        
//        let region = CLCircularRegion(
//            center: cords,
//            radius: 100,
//            identifier: UUID().uuidString)
//        
//        region.notifyOnExit = true
//        region.notifyOnEntry = true
//        
//        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    
}

struct SwiftUILocalNotifications: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Permission") {
                NotificationManager.instance.requestAuthorization()
            }
            
            Button("Schedule Notification") {
                NotificationManager.instance.scheduleNotification()
            }
            
            Button("Cancel All Notifications") {
                NotificationManager.instance.cancelNotifications()
            }
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

#Preview {
    SwiftUILocalNotifications()
}
