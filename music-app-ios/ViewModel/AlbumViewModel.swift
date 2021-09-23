//
//  AlbumViewModel.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/21.
//

import Foundation
import Combine

final class AlbumViewModel: ObservableObject {
    @Published var album: Album = load("albumAudiosData.json")
}
