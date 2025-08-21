//
//  PhotoModel.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 8/19/25.
//

import Foundation

struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
