// Lesson 3
//
//  SwiftUIRotationGesture.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

/// Lesson 3 - shows "RotationGesture()" Lets the user ROTATE an object
struct SwiftUIRotationGesture: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white, .black)
            .padding(50)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring){
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    SwiftUIRotationGesture()
}
