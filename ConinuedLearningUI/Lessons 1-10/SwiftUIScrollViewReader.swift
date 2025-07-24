// Lesson 5
//
//  SwiftUIScrollViewReader.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

struct SwiftUIScrollViewReader: View {
    
    @State var textFieldValue: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            TextField("Enter a number here", text: $textFieldValue)
                .frame(height: 55)
                .padding(.leading)
                .border(.gray)
                .padding()
                .keyboardType(.numberPad)
            
            Button("Scroll To \(textFieldValue)") {
                withAnimation(.easeInOut(duration: 1.0)) {
                    let index = Int(textFieldValue) ?? 0
                    scrollToIndex = index
//                    proxy.scrollTo(30, anchor: .center)
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
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
                    .onChange(of: scrollToIndex) { oldValue, newValue in
                        proxy.scrollTo(newValue, anchor: .top)
                    }
                }
            }
        }
    }
}

#Preview {
    SwiftUIScrollViewReader()
}
