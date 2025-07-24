// Lesson 6
//
//  SwiftUIGeometryReader.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

struct SwiftUIGeometryReader: View {
    @State var viewing1 = true
    @State var viewing2 = false
    
    var body: some View {
        ZStack {
            if viewing2 {
                
            }
            
            if viewing1 {
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(.red)
                            .frame (width: geometry.size.width * 0.6666)
                        Rectangle()
                            .fill(.blue)
                    }
                    .ignoresSafeArea()
                }
            }
            
            VStack {
                HStack {
                    Button("View 1") {
                        viewing1 = true
                        viewing2 = false
                    }
                    Button("View 2") {
                        viewing1 = false
                        viewing2 = true
                    }
                }
                .tint(.white)
                Spacer()
            }
        }
    }
}

#Preview {
    SwiftUIGeometryReader()
}
