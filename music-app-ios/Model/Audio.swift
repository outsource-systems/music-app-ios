//
//  Audio.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import Foundation
import CoreLocation

struct Audio: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var time: String
    var artists: [Artist]
    var lyrists: [Lyrist]
    var composers: [Composer]
    var posterUrl: String?
    var isFavorite: Bool
    var sortNumber: Int?
    var url: String?
}
