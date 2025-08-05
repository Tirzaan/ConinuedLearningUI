// Lesson 16
//
//  SwiftUIWeakSelf.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/5/25.
//

import SwiftUI

struct SwiftUIWeakSelf: View {
    
    @AppStorage("count") var count: Int?
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink("Navigate") {
                    WeakSelfSecondScreen()
                }
                
                
                
                VStack {
                    HStack {
                        Spacer()
                        HStack {
                            Text("Scenes Loaded: ")
                                .font(.headline)
                            Text("\(count ?? 0)")
                                .font(.title)
                        }
                        .padding()
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    Spacer()
                    
                    Text("Reset Count")
                        .onTapGesture {
                            count = 0
                        }
                }
                
            }
            .navigationTitle(Text("First View"))
        }
    }
}

struct WeakSelfSecondScreen: View {
    
    @StateObject var viewModel = WeakSelfSecondScreenViewModel()
    @AppStorage("count") var count: Int?
    
    var body: some View {
        ZStack {
            VStack {
                Text("Second View")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.red)
                
                if let data = viewModel.data {
                    Text(data)
                }
            }
            VStack {
                HStack {
                    Spacer()
                    HStack {
                        Text("Scenes Loaded: ")
                            .font(.headline)
                        Text("\(count ?? 0)")
                            .font(.title)
                    }
                    .padding()
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Spacer()
            }
        }
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    
    @Published var data: String? = nil
    
    init() {
        print("Initialized Now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        GetData()
    }
    
    deinit {
        print("Deinitialized Now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func GetData() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.data = "new data"
        }
    }
    
}

#Preview {
    SwiftUIWeakSelf()
}
