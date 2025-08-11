// Lesson 15
//
//  SwiftUIThreads.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/5/25.
//

import SwiftUI

class ThreadsViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func fetchData() {
        
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            print("Is on main thread 1: \(Thread.isMainThread)")
            print("Current thread 1: \(Thread.current)")
            
            DispatchQueue.main.async {
                self.dataArray = newData
                
                print("Is on main thread 2: \(Thread.isMainThread)")
                print("Current thread 2: \(Thread.current)")
            }
        }
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
    
}

///Lesson 15 - Shows different "Theads" to have things load more smoothally
struct SwiftUIThreads: View {
    
    @StateObject var viewModel = ThreadsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        viewModel.fetchData()
                    }
                
                ForEach(viewModel.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    SwiftUIThreads()
}
