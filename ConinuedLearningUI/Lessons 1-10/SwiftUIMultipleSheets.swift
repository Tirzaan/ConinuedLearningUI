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

// 1 - use binding
// 2 - use multiple .sheets // Does not work any more
// 3 - use $item

/// Shows Multiple Sheets in one view
struct SwiftUIMultipleSheets: View {
    
//    @State var selectedModel: RandomModel = RandomModel(title: "Starting Title")
                                                           //NEEDED FOR "1 - use binding" *
    @State var selectedModel: RandomModel? = nil
//    @State var showSheet: Bool = false                  // NEEDED FOR "1 - use binding" *
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Sheet \(index)") {
                        selectedModel = RandomModel(title: "Sheet #\(index)")
 //                     showSheet.toggle()                // NEEDED FOR "1 - use binding" *
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                SheetView(selectedModel: model)
            }
        }
        .frame(maxWidth: .infinity)
//        .sheet(isPresented: $showSheet) {               // NEEDED FOR "1 - use binding" *
//            SheetView(selectedModel: selectedModel)
//        }
    }
}

struct SheetView: View {
    
//    @Binding var selectedModel: RandomModel             // NEEDED FOR "1 - use binding" *
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
