// Lesson 4
//
//  SwiftUIDragGesture.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

/// Lesson 4 - shows "DragGesture()". Lets the user DRAG an object
struct SwiftUIDragGesture: View {
    
    @State var offset: CGSize = .zero
    
    @State var viewingSquare: Bool = true
    @State var viewingTinder: Bool = false
    @State var viewingSignUp: Bool = false
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.84
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            if viewingSignUp {
                ZStack {
                    Color.green.ignoresSafeArea()
                    
                    SignUpView()
                        .offset(y: startingOffsetY)
                        .offset(y: currentDragOffsetY)
                        .offset(y: endingOffsetY)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    withAnimation(.spring) {
                                        currentDragOffsetY = value.translation.height
                                    }
                                }
                                .onEnded { value in
                                    withAnimation(.spring()){
                                        if currentDragOffsetY < -150 {
                                            endingOffsetY = -startingOffsetY
                                        } else if endingOffsetY != 0 && currentDragOffsetY > 150{
                                            endingOffsetY = 0
                                        }
                                        currentDragOffsetY = 0
                                    }
                                }
                        )
                }
                .ignoresSafeArea(edges: .bottom)
            }
            if viewingTinder {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 500)
                    .offset(offset)
                    .scaleEffect(getScaleAmount())
                    .rotationEffect(Angle(degrees: getRotationAmount()))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear) {
                                    offset = value.translation
                                }
                            }
                            .onEnded { value in
                                withAnimation(.spring) {
                                    offset = .zero
                                }
                            }
                    )
            }
            if viewingSquare {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 100, height: 100)
                            .offset(offset)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        withAnimation(.linear) {
                                            offset = value.translation
                                        }
                                    }
                                    .onEnded { value in
                                        withAnimation(.spring) {
                                            offset = .zero
                                        }
                                    }
                            )
            }
            
            VStack {
                if viewingTinder {
                    Text("\(offset.width)")
                }
                if viewingSignUp {
                    Text("\(currentDragOffsetY)")
                }
                HStack {
                    Button("square") {
                        viewingSquare = true
                        viewingTinder = false
                        viewingSignUp = false
                    }
                    Button("tinder") {
                        viewingSquare = false
                        viewingTinder = true
                        viewingSignUp = false
                    }
                    Button("Sign Up") {
                        viewingSquare = false
                        viewingTinder = false
                        viewingSignUp = true
                    }
                }
                Spacer()
            }
        }
        
        
    }
    
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 10
        return percentageAsDouble * maxAngle
    }
}

#Preview {
    SwiftUIDragGesture()
}

struct SignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Sign Up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description for the app, this is my favorite SwiftUI course")
                .multilineTextAlignment(.center)
            
            Text("Create an Account")
                .foregroundStyle(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            
        }
        
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
