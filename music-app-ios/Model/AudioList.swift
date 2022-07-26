//
//  AudioList.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/21.
//

import Foundation

struct AudioList: Hashable, Codable {
    var audiosTitle: String = String()
    var audios: [Audio] = [Audio]()
}
