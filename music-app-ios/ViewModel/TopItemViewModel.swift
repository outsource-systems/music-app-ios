//
//  TopItemViewModel.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import Foundation
import Combine
import Alamofire

final class TopItemViewModel: ObservableObject {
    @Published var items: [Audio] = [Audio]()
    @Published var headerTitle: String = "Top Songs"
    let rightLinkText: String = "See All"

    init() {
        self.items = load("topAudiosData.json")
    }
}
