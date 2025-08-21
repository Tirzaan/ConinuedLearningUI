//
//  SwiftUIDownloadingImages.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/19/25.
//

import SwiftUI

struct SwiftUIDownloadingImages: View {
    
    @StateObject var viewModel = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.dataArray) { model in
                    SwiftUIDownloadingImagesRow(model: model)
                }
            }
            .listStyle(.plain)
            
            .navigationTitle("Downloading Images")
        }
    }
}

#Preview {
    SwiftUIDownloadingImages()
}
