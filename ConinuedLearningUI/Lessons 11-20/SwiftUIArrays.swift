// Lesson 13
//
//  SwiftUIArrays.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/28/25.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        UpdateFilteredArray()
    }
    
    func UpdateFilteredArray() {
        
        //Sort
        /*
         filteredArray = dataArray.sorted { (user1, user2) -> Bool in
         return user1.points > user2.points
         }
         |    ^
         |Same|
         v    |
         filteredArray = dataArray.sorted { $0.points > $1.points }
         */
        
        //Filter
        /*
    //        filteredArray = dataArray.filter({ (user) -> Bool in
    //            return user.isVerified
    //        })
    //        |    ^
    //        |Same|
    //        v    |
    //        filteredArray = dataArray.filter { $0.isVerified }
         */
        
        //Map
        /*
            mappedArray = dataArray.map({ user -> String in
                return user.name ?? "ERROR"
            })
    //        |    ^
    //        |Same|
    //        v    |
    //        mappedArray = dataArray.map { $0.name }
            
            //Compact
    //        mappedArray = dataArray.compactMap({ user -> String? in
    //            return user.name
    //        })
    //        |    ^
    //        |Same|
    //        v    |
    //        mappedArray = dataArray.compactMap { $0.name }
        */
        
        let sort = dataArray.sorted(by: { $0.points > $1.points })
        let filter = dataArray.filter({ $0.isVerified })
        let map = dataArray.compactMap({ $0.name })
        
        
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified })
            .compactMap({ $0.name })
        
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick", points: 5, isVerified: true)
        let user2 = UserModel(name: nil, points: 12, isVerified: false)
        let user3 = UserModel(name: "Tirzaan", points: 50, isVerified: true)
        let user4 = UserModel(name: "Steve", points: 2, isVerified: true)
        let user5 = UserModel(name: "Thomas", points: 0, isVerified: false)
        let user6 = UserModel(name: nil, points: 8, isVerified: false)
        let user7 = UserModel(name: "Michael", points: 8000, isVerified: true)
        let user8 = UserModel(name: "ollie", points: 10, isVerified: false)
        let user9 = UserModel(name: "Smith", points: 2, isVerified: true)
        let user10 = UserModel(name: "Sam", points: 7, isVerified: false)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        ])
    }
    
}

struct SwiftUIArrays: View {
    
    @StateObject var viewModel = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
//                ForEach(viewModel.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(.blue)
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                    .padding(.horizontal)
//                }
                
                ForEach(viewModel.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    SwiftUIArrays()
}
