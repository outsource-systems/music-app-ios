//
//  ProductList.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/21.
//

import Foundation

struct ProductList: Hashable, Codable {
    var productsTitle: String
    var products: [Product]
}
