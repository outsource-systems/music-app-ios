//
//  RecommendProductView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/22.
//

import SwiftUI

struct RecommendProductView: View {
    let recommendProductViewModel: RecommendProductViewModel = RecommendProductViewModel()
    
    var body: some View {
        let recommendProduct: Product = recommendProductViewModel.recommendProduct
        LeftImageItemView(size: 100, title: recommendProduct.productTitle, count: recommendProduct.count ?? 0, date: recommendProduct.productReleaseDate, imageUrl: recommendProduct.posterFile)
    }
}

struct RecommendProductView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendProductView()
    }
}
