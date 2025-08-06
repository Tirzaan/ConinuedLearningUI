// Lesson 17
//
//  SwiftUITypeAlias.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/5/25.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct SwiftUITypeAlias: View {
    
    @State var movie: MovieModel = MovieModel(
        title: "Movie",
        director: "John Doe",
        count: 5
    )
    @State var tvshow: TVModel = TVModel(
        title: "TV Show",
        director: "Jake Nielson",
        count: 10
    )
    
    var body: some View {
        VStack {
            Text(movie.title)
            Text(movie.director)
            Text("\(movie.count)")
            Divider()
            Text(tvshow.title)
            Text(tvshow.director)
            Text("\(tvshow.count)")
        }
    }
}

#Preview {
    SwiftUITypeAlias()
}
