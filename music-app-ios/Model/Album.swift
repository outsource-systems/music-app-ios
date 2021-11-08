//
//  Album.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/20.
//

import Foundation

struct Album: Hashable, Codable, Identifiable {
    var id: Int
    var recordType: String
    var name: String
    var posterUrl: String
    var artists: [Artist]
    var releaseDate: String
    var category: String
    var audios: [Audio]
}
