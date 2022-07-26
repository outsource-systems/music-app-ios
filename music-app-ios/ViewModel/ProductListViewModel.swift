//
//  ProductListViewModel.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/22.
//

import Foundation
import Combine

final class ProductListViewModel: ObservableObject {
   var productsLists: [ProductList] = [load("singlesAndEpsData.json"), load("albumsData.json")]
   var productListApiModels: [ApiModel] = load("productListApi.json")
}
