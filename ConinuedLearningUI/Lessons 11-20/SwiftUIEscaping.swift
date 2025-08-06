// Lesson 18
//
//  SwiftUIEscaping.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/5/25.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
//        let newData = downloadData()
//        text = newData
        
//        downloadData3 { [weak self] data in
//            self?.text = data
//        }
        
        downloadData5 { [weak self] downloadResult in
            self?.text = downloadResult.data
        }
    }
    
    func downloadData() -> String {
        return "Hello, World!"
    }
    
    //completionHandler returns Void or () witch returns nothing
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New Data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("New Data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (downloadResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = downloadResult(data: "New data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping downloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = downloadResult(data: "New data!")
            completionHandler(result)
        }
    }
}

struct downloadResult {
    let data: String
}

typealias downloadCompletion = (downloadResult) -> Void

struct SwiftUIEscaping: View {
    
    @StateObject var viewModel = EscapingViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .onTapGesture {
                viewModel.getData()
            }
    }
}

#Preview {
    SwiftUIEscaping()
}
