// Lesson 10
//
//  SwiftUIHaptics.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

class HapticManager {
    
    static let instance = HapticManager() //Singletion
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
}

/// Lesson 9 - Shows Buttons that send "Haptics" (Vibrations) to the device
struct SwiftUIHaptics: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("notification success") { HapticManager.instance.notification(type: .success) }
            Button("notification warning") { HapticManager.instance.notification(type: .warning) }
            Button("notification error") { HapticManager.instance.notification(type: .error) }
            Divider()
            Button("impact soft") { HapticManager.instance.impact(style: .soft) }
            Button("impact light") { HapticManager.instance.impact(style: .light) }
            Button("impact medium") { HapticManager.instance.impact(style: .medium) }
            Button("impact rigid") { HapticManager.instance.impact(style: .rigid) }
            Button("impact heavy") { HapticManager.instance.impact(style: .heavy) }
        }
    }
}

#Preview {
    SwiftUIHaptics()
}
