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
        LeftImageItemView(size: 100, name: recommendProduct.name, count: recommendProduct.count ?? 0, date: recommendProduct.releaseDate, imageUrl: recommendProduct.posterUrl)
    }
}

struct RecommendProductView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendProductView()
    }
}
