//
//  ContentView.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

/// Shows all the Lessons in a list as Nav links
struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("1 - Long Press Gesture") { SwiftUILongPressGesture() }
                NavigationLink("2 - Magnification Gesture") { SwiftUIMagnificationGesture() }
                NavigationLink("3 - Rotation Gesture") { SwiftUIRotationGesture() }
                NavigationLink("4 - Drag Gesture") { SwiftUIDragGesture() }
                NavigationLink("5 - Scroll View Reader") { SwiftUIScrollViewReader() }
            }
            
            .navigationTitle("Lessons")
        }
    }
}

#Preview {
    ContentView()
}
