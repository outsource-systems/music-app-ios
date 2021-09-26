//
//  TopItemViewModel.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import Foundation
import Combine

final class TopItemViewModel: ObservableObject {
    @Published var audioList: AudioList = load("topAudiosData.json")
}
