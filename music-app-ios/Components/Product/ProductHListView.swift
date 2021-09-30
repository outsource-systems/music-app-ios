//
//  ProductHListView.swift
//  music-app-ios
//
//  Created by Apple on 2021/10/01.
//

import SwiftUI

struct ProductHListView: View {
    var products: [Product]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(products, id: \.self) { product in
                    ProductNavigationLinkView(product: product)
                }
            }.padding(.horizontal)
        }
    }
}

struct ProductHListView_Previews: PreviewProvider {
    static var previews: some View {
        let productListViewModel: ProductListViewModel = ProductListViewModel()
        ProductHListView(products: productListViewModel.productsLists[0].products)
    }
}
