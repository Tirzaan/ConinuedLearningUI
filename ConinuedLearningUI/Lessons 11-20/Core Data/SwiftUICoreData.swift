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
    
    func updateFruit(entity: FruitEntity) {
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
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
    @State var AddFruitText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Add Fruit here", text: $AddFruitText)
                    .font(.headline)
                    .padding()
                    .padding(.horizontal, -5)
                    .background(.gray.opacity(0.25))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                
                Button {
                    guard !AddFruitText.isEmpty else { return }
                    viewModel.addFruit(text: AddFruitText)
                    AddFruitText = ""
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.horizontal)
                }

                List {
                    ForEach(viewModel.savedEntities) { entity in
                        Text(entity.name ?? "No Name")
                            .onTapGesture {
                                viewModel.updateFruit(entity: entity)
                            }
                    }
                    .onDelete(perform: viewModel.deleteFruit)
                }
                .listStyle(.plain)
            }
            .navigationTitle(Text("Fruits"))
        }
    }
}

#Preview {
    SwiftUICoreData()
}
