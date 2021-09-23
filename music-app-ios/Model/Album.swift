//
//  Album.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/20.
//

import Foundation

struct Album: Hashable, Codable, Identifiable {
    var id: Int
    var productType: String
    var productTitle: String
    var posterFile: String
    var productArtists: [Artist]
    var productReleaseDate: String
    var genre: String
    var count: Int
    var audios: [Audio]
}
