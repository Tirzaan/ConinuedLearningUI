// Lesson 7
//
//  SwiftUIMultipleSheets.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI

struct RandomModel: Identifiable {
    var id: String = UUID().uuidString
    var title: String
}

struct SwiftUIMultipleSheets: View {
    
    @State var selectedModel: RandomModel = RandomModel(title: "Starting Title")
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Sheet 1") {
                selectedModel = RandomModel(title: "1")
                showSheet.toggle()
            }
            
            Button("Sheet 2") {
                selectedModel = RandomModel(title: "2")
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet) {
            SheetView(selectedModel: selectedModel)
        }
    }
}

struct SheetView: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
            .fontWeight(.semibold)
    }
}

#Preview {
    SwiftUIMultipleSheets()
}
