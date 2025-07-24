// Lesson 8
//
//  SwiftUIMask.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

struct SwiftUIMask: View {
    
    @State var rating: Int = 0
    
    var body: some View {
        ZStack {
            starsView
                .overlay { overlayView.mask(starsView) }
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [.red, .yellow],
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    .frame(width: CGFloat(rating) / 5  * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            if rating != index || index != 1 {
                                rating = index
                            } else {
                                rating -= 1
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    SwiftUIMask()
}
