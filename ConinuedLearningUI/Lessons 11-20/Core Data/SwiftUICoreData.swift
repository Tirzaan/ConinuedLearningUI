// Lesson 14
//
//  SwiftUICoreData.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/29/25.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA \(error)")
            }
        }
    }
    
}

struct SwiftUICoreData: View {
    
    @StateObject var viewModel = CoreDataViewModel()
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    SwiftUICoreData()
}
