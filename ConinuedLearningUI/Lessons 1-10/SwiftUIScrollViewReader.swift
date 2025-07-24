// Lesson 5
//
//  SwiftUIScrollViewReader.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

struct SwiftUIScrollViewReader: View {
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                
                Button("Go To #49") {
                    proxy.scrollTo(49, anchor: nil)
                }
                
                ForEach(0..<50) { index in
                    Text("This is item #\(index)")
                        .font(.headline)
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10)
                        .padding()
                        .id(index)
                }
            }
        }
    }
}

#Preview {
    SwiftUIScrollViewReader()
}
