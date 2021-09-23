//
//  MainView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct MainView: View {
    var productListViewModel: ProductListViewModel
    var recommendProductViewModel: RecommendProductViewModel
    var body: some View {
        TabBarView(productListViewModel: productListViewModel, recommendProductViewModel: recommendProductViewModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let productListViewModel: ProductListViewModel = ProductListViewModel()
        let recommendProductViewModel: RecommendProductViewModel = RecommendProductViewModel()
        MainView(productListViewModel: productListViewModel, recommendProductViewModel: recommendProductViewModel).environment(\.colorScheme, .dark)
        MainView(productListViewModel: productListViewModel, recommendProductViewModel: recommendProductViewModel)
    }
}
