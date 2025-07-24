// Lesson 6
//
//  SwiftUIGeometryReader.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

/// Lesson 6 - Shows "GeometryReader". Locates the postion, Rotation ect. of an object
struct SwiftUIGeometryReader: View {
    @State var viewing1 = false
    @State var viewing2 = true
    
    
    func getPercentage(geometry: GeometryProxy) -> Double {
        let maxDistance = geometry.size.width / 2
        let currentX = geometry.frame(in: .global).minX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        ZStack {
            if viewing2 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<20) { index in
                            GeometryReader { geometry in
                                RoundedRectangle(cornerRadius: 20)
                                    .rotation3DEffect(
                                        Angle(degrees: getPercentage(geometry: geometry) * 40),
                                        axis: (x: 0.0, y: 1.0, z: 0.0))
                            }
                            .frame(width: 300, height: 250)
                            .shadow(color: .gray, radius: 10)
                            .padding()
                            .frame(maxHeight: .infinity)
                        }
                    }
                }
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
                .tint(.black)
                Spacer()
            }
        }
    }
}

#Preview {
    SwiftUIGeometryReader()
}
