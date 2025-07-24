// Lesson 4
//
//  SwiftUIDragGesture.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

struct SwiftUIDragGesture: View {
    
    @State var offset: CGSize = .zero
    
    var body: some View {
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
}

#Preview {
    SwiftUIDragGesture()
}
