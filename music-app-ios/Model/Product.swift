//
//  Product.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/21.
//

import Foundation

struct Product: Hashable, Codable, Identifiable {
    var id: Int
    var recordType: String
    var name: String
    var posterUrl: String
    var artists: [Artist]?
    var releaseDate: String
    var category: String?
    var count: Int?
    var audios: [Audio]?
}
