//
//  ProductVListView.swift
//  music-app-ios
//
//  Created by Apple on 2021/10/01.
//

import SwiftUI

struct ProductVListView: View {
    var products: [Product]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                ForEach(products, id: \.self) { product in
                    ProductNavigationLinkView(product: product, size: 180)
                }
            }
        }.padding(.vertical)
    }
}

struct ProductVListView_Previews: PreviewProvider {
    static var previews: some View {
        let productListViewModel: ProductListViewModel = ProductListViewModel()
        ProductVListView(products: productListViewModel.productsLists[0].products)
    }
}
