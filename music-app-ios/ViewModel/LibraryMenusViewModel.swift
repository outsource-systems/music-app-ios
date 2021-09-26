//
//  LibraryMenusViewModel.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import Foundation
import Combine

final class LibraryMenusViewModel: ObservableObject {
    @Published var libraryMenus = [LibraryMenuModel]
}
