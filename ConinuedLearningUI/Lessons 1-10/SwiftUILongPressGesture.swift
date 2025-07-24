// Lesson 1
//
//  SwiftUILongPressGesture.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

struct SwiftUILongPressGesture: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
            VStack {
                Rectangle()
                    .fill(isSuccess ? .green : .blue)
                    .frame(maxWidth: isComplete ? .infinity : 0)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.gray)
                
                HStack {
                    Text("Click Here")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50, pressing: { isPressing in
                            // from start of press to the end of duration
                            if isPressing {
                                withAnimation(.linear(duration: 1.0)) {
                                    isComplete = true
                                }
                            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    if !isSuccess {
                                        withAnimation(.linear) {
                                            isComplete = false
                                        }
                                    }
                                }
                            }
                            
                        }) {
                            // at the end of duration
                            withAnimation(.easeInOut) {
                                isSuccess = true
                            }
                        }
                    
                    Text("Reset")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            isComplete = false
                            isSuccess = false
                        }
                }
            }
            
            
            
//        Text(isComplete ? "Complete!" : "Not Complete!")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? .green : .gray)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
////            .onTapGesture {
////                isComplete.toggle()
////            }
//            .onLongPressGesture(minimumDuration: 3.0, maximumDistance: 50) {
//                isComplete.toggle()
//            }
    }
}

#Preview {
    SwiftUILongPressGesture()
}
