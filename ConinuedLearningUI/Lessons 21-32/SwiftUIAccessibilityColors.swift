// Lesson 28
//
//  SwiftUIAccessibilityColors.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/20/25.
//

import SwiftUI

struct SwiftUIAccessibilityColors: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var invertColors
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Button1") {
                    
                }
                .foregroundStyle(colorSchemeContrast == .increased ? .white : .primary)
                .buttonStyle(.borderedProminent)
                
                Button("Button2") {
                    
                }
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                
                Button("Button3") {
                    
                }
                .foregroundStyle(invertColors ? .black : .white)
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(invertColors ? .blue : .green)
                
                Button("Button4") {
                    
                }
                .foregroundStyle(differentiateWithoutColor ? .white : .green)
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(differentiateWithoutColor ? .black : .purple)
            }
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(reduceTransparency == true ? .black : .black.opacity(0.5))
            
//            .navigationTitle("Hi")
        }
    }
}

#Preview {
    SwiftUIAccessibilityColors()
}
