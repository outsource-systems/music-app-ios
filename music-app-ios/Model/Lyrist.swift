//
//  Lyrist.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/20.
//

import Foundation

struct Lyrist: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String = String()
    var posterUrl: String = String()
}
