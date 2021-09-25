//
//  ProductViewModel.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/23.
//

import Foundation
import Combine

final class ProductViewModel: ObservableObject {
    @Published var product: Product = load("productData.json")
}
