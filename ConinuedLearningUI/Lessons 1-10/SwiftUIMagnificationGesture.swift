// Lesson 2
//
//  SwiftUIMagnificationGesture.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

struct SwiftUIMagnificationGesture: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        Text("Hello, World!")
            .font(.title)
            .padding(40)
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(1 + currentAmount + lastAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        currentAmount = value - 1
                    }
                    .onEnded { value in
                        lastAmount += currentAmount
                        currentAmount = 0
                    }
            )
    }
}

#Preview {
    SwiftUIMagnificationGesture()
}
