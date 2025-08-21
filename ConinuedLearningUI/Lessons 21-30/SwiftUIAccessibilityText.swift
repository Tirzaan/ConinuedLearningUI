// lesson 27
//
//  SwiftUIAccessibilityText.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/20/25.
//

import SwiftUI

// Dynamic Text

struct SwiftUIAccessibilityText: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("Welcome to my app")
                        }
                        .font(.title)
                        
                        Text("This is some longer text that expands to multiple lines.")
                            .font(.subheadline)
                    }
                }
            }
            .listStyle(.plain)
            
            .navigationTitle("Hello, World!")
        }
    }
}

#Preview {
    SwiftUIAccessibilityText()
}
