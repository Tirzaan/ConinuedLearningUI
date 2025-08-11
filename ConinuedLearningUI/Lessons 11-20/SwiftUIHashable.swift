// Lesson 12
//
//  SwiftUIHashable.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/25/25.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
}

///Lesson 12 - Shows Hashables that you can put into a ForEach
struct SwiftUIHashable: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "One"),
        MyCustomModel(title: "Two"),
        MyCustomModel(title: "Three"),
        MyCustomModel(title: "Four"),
        MyCustomModel(title: "Five")
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
                .padding()
            }
        }
    }
}

#Preview {
    SwiftUIHashable()
}
