//
//  HomeAudioListView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct HomeAudioListView: View {
    var productListViewModel: ProductListViewModel
    var recommendProductViewModel: RecommendProductViewModel
    
    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            RecommendProductView(recommendProduct: recommendProductViewModel.recommendProduct)
            Spacer().frame(height: 20)
            TopItemsView()
            Spacer().frame(height: 20)
            ForEach(productListViewModel.productsLists, id: \.self) { productList in
                Divider()
                Spacer().frame(height: 20)
                ListHeader(headerTitle: productList.productsTitle, rightLinkText: "See All")
                HListItemView(products: productList.products)
            }
            PremiumButtonView()
        }.padding(.bottom, 100)
    }
}

struct HomeAudioListView_Previews: PreviewProvider {
    static var previews: some View {
        let productListViewModel: ProductListViewModel = ProductListViewModel()
        let recommendProductViewModel: RecommendProductViewModel = RecommendProductViewModel()
        HomeAudioListView(productListViewModel: productListViewModel, recommendProductViewModel: recommendProductViewModel)
    }
}
