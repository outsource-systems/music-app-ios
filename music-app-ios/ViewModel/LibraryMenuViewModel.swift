//
//  LibraryMenuViewModel.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import Foundation
import Combine

final class LibraryMenuViewModel: ObservableObject {
    @Published var libraryMenu: [LibraryMenuItemModel] = load("libraryMenuData.json")
}
