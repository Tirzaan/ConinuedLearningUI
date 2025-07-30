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
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContaner")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA! \(error)")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching data! \(error)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving data! \(error)")
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
