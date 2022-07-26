//
//  Creator.swift
//  music-app-ios
//
//  Created by Apple on 2021/11/08.
//

import Foundation

struct Creator: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String = String()
    var posterUrl: String = String()
}
