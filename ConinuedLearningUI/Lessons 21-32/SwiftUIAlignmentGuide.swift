// Lesson 30
//
//  SwiftUIAlignmentGuide.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/23/25.
//
// Apple Link: https://swiftui-lab.com/alignment-guides/

import SwiftUI

struct SwiftUIAlignmentGuide: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, world!")
                .background(.blue)
                .alignmentGuide(.leading) { dimensions in
                    return dimensions.width / 2
                }
            
            Text("This is another text!")
                .background(.red)
        }
        .background(.orange)
    }
}

struct AlignmentChildView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            row(title: "row 1", showIcon: false)
            row(title: "row 2", showIcon: true)
            row(title: "row 3", showIcon: false)
        }
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
        .padding(40)
    }
    
    private func row(title: String, showIcon: Bool) -> some View {
        HStack(spacing: 10) {
            if showIcon {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
            }
            
            Text(title)
            
            Spacer()
        }
        .background(.red)
        .alignmentGuide(.leading) { dimensions in
            return showIcon ? 40 : 0
        }
    }
}

#Preview {
//    SwiftUIAlignmentGuide()
    AlignmentChildView()
}
