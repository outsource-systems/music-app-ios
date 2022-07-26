//
//  Product.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/21.
//

import Foundation

struct Product: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var recordType: String
    var releaseDate: String
    var posterUrl: String = String()
    var category: String?
    var artists: [Artist]?
    var count: Int?
    var audios: [Audio]?
}
