//
//  Composer.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/20.
//

import Foundation
import SwiftUI
import CoreLocation

struct Composer: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String?
    var posterFile: String?
}