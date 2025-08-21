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
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
//                                .font(.system(size: 20))
                            
                            Text("Welcome to my app")
                                .truncationMode(.tail)
                        }
                        .font(.title)
                        
                        Text("This is some longer text that expands to multiple lines.")
//                            .font(.system(size: 20))
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .truncationMode(.head)
                            .lineLimit(3)
                            .minimumScaleFactor(dynamicTypeSize.customMinScaleFactor)
//                            .minimumScaleFactor(dynamicTypeSize == .accessibility1 ? 0.8 : 1.0)
//                            .minimumScaleFactor(dynamicTypeSize.isAccessibilitySize ? 0.8 : 1.0)
                    }
//                    .frame(height: 100)
                    .background(.red)
                    
                }
            }
            .listStyle(.plain)
            
            .navigationTitle("Hello, World!")
        }
    }
}

extension DynamicTypeSize {
    
    var customMinScaleFactor: CGFloat {
        switch self {
            
        case .xSmall, .small, .medium:
            return 1.0
            
        case .large, .xLarge, .xxLarge:
            return 0.8
            
        default:
            return 0.6

        }
    }
    
}

#Preview {
    SwiftUIAccessibilityText()
}
