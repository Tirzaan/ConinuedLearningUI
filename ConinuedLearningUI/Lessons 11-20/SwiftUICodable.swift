// Lesson 19
//
//  SwiftUICodable.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/11/25.
//

import SwiftUI

// Codable = Decodable & Encodable

struct CustomerModel: Identifiable, Codable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
    // NEEDED FOR Decodable & Encodable NOT Codable (is done behind the scenes)
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case points
//        case isPremium /* = "is_premium"*/
//    }
//    
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//    
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(points, forKey: .points)
//        try container.encode(isPremium, forKey: .isPremium)
//    }
}

class CodableViewModel: ObservableObject {
    
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else { return }
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        
//        do {
//            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
//        } catch let error {
//            print("Error Decoing JSON: \(error)")
//        }
        
//        if
//            let localData = try? JSONSerialization.jsonObject(with: data),
//            let dictionaty = localData as? [String: Any],
//            let id = dictionaty["id"] as? String,
//            let name = dictionaty["name"] as? String,
//            let points = dictionaty["points"] as? Int,
//            let isPremium = dictionaty["isPremium"] as? Bool {
//            
//            let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
//            customer = newCustomer
//        }
        
//        print("JSON Data:")
//        print("\(data)")
//        let jsonString = String(data: data, encoding: .utf8)
//        print(jsonString)
    }
    
    func getJSONData() -> Data? {
        
        let customer = CustomerModel(id: "111", name: "Emily", points: 100, isPremium: true)
        let jsonData = try? JSONEncoder().encode(customer)
        
//        let dictionary: [String: Any] = [
//            "id": "12345",
//            "name": "John Doe",
//            "points": 6,
//            "isPremium": false
//        ]
//        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary)
        
        return jsonData
        
    }
    
}

struct SwiftUICodable: View {
    
    @StateObject var viewModel = CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = viewModel.customer {
                Text("id: \(customer.id)")
                Text("Name: \(customer.name)")
                Text("Points: \(customer.points)")
                Text("Premium: \(customer.isPremium.description)")
            }
        }
    }
}

#Preview {
    SwiftUICodable()
}
