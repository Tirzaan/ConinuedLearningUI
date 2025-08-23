// Lesson 31
//
//  SwiftUIVisualEffect.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/23/25.
//

import SwiftUI

struct SwiftUIVisualEffect: View {
    
//    @State var showSpacer: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ForEach(0..<100) { index in
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.orange)
                        .visualEffect { content, geometry in
                            content
                                .offset(x: geometry.frame(in: .global).minY * 0.2)
                        }
                }
            }
        }
        
//        VStack {
//            Text("Hello, World!")
//                .padding()
//                .background(.red)
//                .visualEffect { content, geometry in
//                    content
//                        .grayscale(geometry.frame(in: .global).minY < 300 ? 1 : 0)
//                    //                    .grayscale(geometry.size.width >= 200 ? 1 : 0)
//                }
//            
//            if showSpacer {
//                Spacer()
//            }
//        }
//        .animation(.easeInOut, value: showSpacer)
//        .onTapGesture {
//            showSpacer.toggle()
//        }
    }
}

#Preview {
    SwiftUIVisualEffect()
}
