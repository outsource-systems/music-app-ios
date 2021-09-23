//
//  AudioViewModel.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/21.
//

import Foundation
import Combine

final class AudioViewModel: ObservableObject {
    @Published var audio: Audio = load("audioData.json")
}
