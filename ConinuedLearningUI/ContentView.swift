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
                NavigationLink("6 - Geometry Reader") { SwiftUIGeometryReader() }
                NavigationLink("7 - Multiple Sheets") { SwiftUIMultipleSheets() }
                NavigationLink("8 - Mask") { SwiftUIMask() }
                NavigationLink("9 - Sound Effects") { SwiftUISoundEffects() }
                NavigationLink("10 - Haptics") { SwiftUIHaptics() }
                NavigationLink("11 - Local Notifications") { SwiftUILocalNotifications() }
                NavigationLink("12 - Hashable") { SwiftUIHashable() }
                NavigationLink("13 - Arrays") { SwiftUIArrays() }
                NavigationLink("14 - CoreData") { SwiftUICoreData() }
                NavigationLink("15 - Threads") { SwiftUIThreads() }
                NavigationLink("16 - Weak Self") { SwiftUIWeakSelf() }
                NavigationLink("17 - Type Alias") { SwiftUITypeAlias() }
                NavigationLink("18 - Escaping") { SwiftUIEscaping() }
                NavigationLink("19 - Codable") { SwiftUICodable() }
                NavigationLink("20 - Download With Escaping") { SwiftUIDownloadWithEscaping() }
                NavigationLink("21 - Download With Combine") { SwiftUIDownloadWithCombine() }
                NavigationLink("22 - Timer") { SwiftUITimer() }
                NavigationLink("23 - Subcriber") { SwiftUISubcriber() }
                NavigationLink("24 - File Manager") { SwiftUIFileManager() }
                NavigationLink("25 - Cache") { SwiftUICache() }
                NavigationLink("26 - Downloading Images") { SwiftUIDownloadingImages() }
                NavigationLink("27 - Nothing") { ZStack {Color.red.ignoresSafeArea(); Text("Lesson not watched yet")} }
                NavigationLink("28 - Nothing") { ZStack {Color.red.ignoresSafeArea(); Text("Lesson not watched yet")} }
                NavigationLink("29 - Nothing") { ZStack {Color.red.ignoresSafeArea(); Text("Lesson not watched yet")} }
                NavigationLink("30 - Nothing") { ZStack {Color.red.ignoresSafeArea(); Text("Lesson not watched yet")} }
                NavigationLink("31 - Nothing") { ZStack {Color.red.ignoresSafeArea(); Text("Lesson not watched yet")} }
                NavigationLink("32 - Nothing") { ZStack {Color.red.ignoresSafeArea(); Text("Lesson not watched yet")} }
                NavigationLink("33 - Nothing") { ZStack {Color.red.ignoresSafeArea(); Text("Lesson not watched yet")} }
                NavigationLink("34 - Nothing") { ZStack {Color.red.ignoresSafeArea(); Text("Lesson not watched yet")} }
                NavigationLink("35 - Nothing") { ZStack {Color.red.ignoresSafeArea(); Text("Lesson not watched yet")} }
            }
            
            .navigationTitle("Lessons")
        }
    }
}

#Preview {
    ContentView()
}
