//
//  SwiftUIDownloadingImagesRow.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/19/25.
//

import SwiftUI

struct SwiftUIDownloadingImagesRow: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack {
            SwiftUIDownloadingImageView(url: model.url, key: "\(model.id)")
                .frame(width: 75, height: 75)
            VStack(alignment: .leading){
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundStyle(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SwiftUIDownloadingImagesRow(model: PhotoModel(albumId: 1, id: 1, title: "Title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "thumbnail url"))
}
