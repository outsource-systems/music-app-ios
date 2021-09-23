//
//  RecommendProductView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/22.
//

import SwiftUI

struct RecommendProductView: View {
    var recommendProduct: Product

    var body: some View {
        LeftImageItemView(size: 100, title: recommendProduct.productTitle, count: recommendProduct.count ?? 0, date: recommendProduct.productReleaseDate, imageUrl: recommendProduct.posterFile)
    }
}

struct RecommendProductView_Previews: PreviewProvider {
    static var previews: some View {
        let recommendProductViewModel: RecommendProductViewModel = RecommendProductViewModel()
        RecommendProductView(recommendProduct: recommendProductViewModel.recommendProduct)
    }
}
