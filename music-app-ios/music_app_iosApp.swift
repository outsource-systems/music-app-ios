//
//  music_app_iosApp.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/12.
//

import SwiftUI

@main
struct music_app_iosApp: App {
    let productListViewModel: ProductListViewModel = ProductListViewModel()
    let recommendProductViewModel: RecommendProductViewModel = RecommendProductViewModel()
    var body: some Scene {
        WindowGroup {
            MainView(productListViewModel: productListViewModel, recommendProductViewModel: recommendProductViewModel)
        }
    }
}
