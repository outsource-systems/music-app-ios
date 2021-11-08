//
//  HProductListIView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/23.
//

import SwiftUI

struct HProductListIView: View {
    var products: [Product]?
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(products ?? [], id: \.self) { product in
                    ItemView(title: product.name, size: 150, imageUrl: product.posterUrl)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct HProductListIView_Previews: PreviewProvider {
    static var previews: some View {
        // let productListViewModel: ProductListViewModel = ProductListViewModel()
        HProductListIView(products: [Product]())
    }
}
