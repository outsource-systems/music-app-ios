//
//  RecommendProductViewModel.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/22.
//

import Foundation
import Combine

final class RecommendProductViewModel: ObservableObject {
    @Published var recommendProduct: Product = load("recommendProductData.json")
}
