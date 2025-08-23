// Lesson 21
//
//  SwiftUIDownloadWithCombine.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/11/25.
//

import SwiftUI
import Combine

struct postModelCombine: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [postModelCombine] = []
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // Combine Discution
        /*
         1. sign up for monthly subscription for package to be delivered
         2. the company would make the package behind the scene
         3. recieve the package at front door
         4. make sure ther box is not damaged
         5. open and make sure the item is correct
         6. use the item!!!
         note. cancellable at any time
        
         1. create the publisher
         2. subscribe the publisher on background thread
         3. recieve on main thread
         4. tryMap (check that the data is good)
         5. decode (decode data into PostModels)
         6. sink (put the item into our app)
         7. store (cancel subcription if needed)
        */
        
        URLSession.shared.dataTaskPublisher(for: url)
            //.subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [postModelCombine].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] (returnedPosts) in
                self?.posts = returnedPosts
            })
            .store(in: &cancellables)
        
        // Can replace .sink with:
        /*
//            .sink { (completion) in
//                switch completion {
//                case .finished:
//                    print("Finished")
//                case .failure(let Error):
//                    print("Error: \(Error)")
//                }
//            } receiveValue: { [weak self] (returnedPosts) in
//                self?.posts = returnedPosts
//            }
         */

    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
}

struct SwiftUIDownloadWithCombine: View {
    
    @StateObject var viewModel = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

#Preview {
    SwiftUIDownloadWithCombine()
}
