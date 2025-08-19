//
//  SwiftUICache.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/18/25.
//

import SwiftUI

class cacheManager {
    static let instance = cacheManager()
    private init() {}
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }()
    
    func add(image: UIImage, name: String) -> String {
        imageCache.setObject(image, forKey: name as NSString)
        return "Added \(name) to cache"
    }
    
    func remove(name: String) -> String  {
        imageCache.removeObject(forKey: name as NSString)
        return "Removed \(name) from cache"
    }
    
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
    
}

class CacheViewModel: ObservableObject {
    
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    @Published var infoMessage: String = ""
    
    let imageName: String = "ChatGPT_Cube"
    let manager = cacheManager.instance
    
    init() {
        getImageFromAssets()
    }
    
    func getImageFromAssets() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = startingImage else { return }
        infoMessage = manager.add(image: image, name: imageName)
    }
    
    func removeFromCache() {
        infoMessage = manager.remove(name: imageName)
    }
    
    func getImageFromCache() {
        if let returnedImage = manager.get(name: imageName) {
            cachedImage = returnedImage
            infoMessage = "Got \(imageName) from cache"
        } else {
            infoMessage = "\(imageName) not found in cache"
        }
    }
    
}

struct SwiftUICache: View {
    
    @StateObject var viewModel = CacheViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if let image = viewModel.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                HStack {
                    Button {
                        viewModel.saveToCache()
                    } label: {
                        Text("Save To Cache")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal, 10)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button {
                        viewModel.removeFromCache()
                    } label: {
                        Text("Delete From Cache")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal, 10)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Button {
                    viewModel.getImageFromCache()
                } label: {
                    Text("Get From Cache")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding()
                        .padding(.horizontal, 10)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                if let image = viewModel.cachedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                Text(viewModel.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.purple)
                
                Spacer()
            }
            .navigationTitle("Cache")
        }
    }
}

#Preview {
    SwiftUICache()
}
