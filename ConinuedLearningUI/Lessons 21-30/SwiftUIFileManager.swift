// Lesson 24
//
//  SwiftUIFileManager.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/14/25.
//
//Apple Link: https://developer.apple.com/documentation/foundation/optimizing-your-app-s-data-for-icloud-backup

import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    let folderName = "MyApp_Images"
    
    init() {
        createFolder()
    }
    
    func createFolder() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Successfully created folder!")
            } catch let Error {
                print("Error creating folder: \(Error)")
            }
        }
        
    }
    
    func deleteFolder() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Successfully deleted folder!")
        } catch let Error {
            print("Error deleting folder: \(Error)")
        }
        
    }
    
    func saveImage(image: UIImage, name: String) -> String {
//        image.jpegData(compressionQuality: 1.0) (Current Image Not jpeg)
        
        guard
              let data = image.pngData(),
              let path = getPathForImage(name: name) else {
            return "Error Getting data!"
            
        }
        
        //Types of directories go to the "Apple Link" and go to "Storing Your App's Data Efficiently"
//        .documentDirectory //For files that can not be recreated by you app OR user generated
//        .cachesDirectory //For files you want to redownload muliple times
//        let directory3 = FileManager.default.temporaryDirectory //For Temporary Files
        
        
        
        do {
            try data.write(to: path)
            print(path)
            return "Success saving image!"
        } catch let Error {
            return "Error saving image: \(Error)"
        }
        
        
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Error Getting Path")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
        
    }
    
    func deleteImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            return "Error Getting Path!"
             
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Successfully deleted image!"
        } catch let Error {
            return "Error deleting image: \(Error)"
        }
    }
    
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).png") else {
            print("Error Getting Path")
            return nil
        }
        
        return path
    }
    
}

class FileManagerViewModel: ObservableObject {

    @Published var image: UIImage? = nil
    let imageName: String = "ChatGPT_Cube"
    let manager = LocalFileManager.instance
    @Published var infoMessage: String = ""
    
    init() {
        getImageFromAssetsFolder()
//        getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else { return }
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    
    func deleteImage() {
        infoMessage = manager.deleteImage(name: imageName)
        manager.deleteFolder()
    }
    
}

/// Lesson 24 - Shows how to save data in files
struct SwiftUIFileManager: View {
    
    @StateObject var viewModel = FileManagerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                HStack {
                    Button {
                        viewModel.saveImage()
                    } label: {
                        Text("Save To File Manager")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button {
                        viewModel.deleteImage()
                    } label: {
                        Text("Delete From File Manager")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Text(viewModel.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.purple)
                
                Spacer()
            }
            .navigationTitle("File Manager")
        }
    }
}

#Preview {
    SwiftUIFileManager()
}
