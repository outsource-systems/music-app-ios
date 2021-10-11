//
//  HomeAudioListView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct HomeAudioListView: View {
    var productListViewModel: ProductListViewModel = ProductListViewModel()
    
    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            RecommendProductView()
            Spacer().frame(height: 20)
            TopItemsView()
            Spacer().frame(height: 20)
            ForEach(productListViewModel.productsLists, id: \.self) { productList in
                Divider()
                Spacer().frame(height: 20)
                ProductListView(products: productList.products, headerTitle: productList.productsTitle)
            }
            PremiumButtonView()
        }.padding(.bottom, 100)
    }
}

struct HomeAudioListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAudioListView()
    }
}
