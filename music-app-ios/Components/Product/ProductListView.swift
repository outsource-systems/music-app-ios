//
//  ProductListView.swift
//  music-app-ios
//
//  Created by Apple on 2021/10/01.
//

import SwiftUI

struct ProductListView: View {
    var products: [Product]
    let headerTitle: String
    let rightLinkText: String = "See All"
    
    var body: some View {
        VStack {
            ListHeader(headerTitle: headerTitle, rightLinkText: rightLinkText, rightLinkDestination: AnyView(ProductVListView(products: products).navigationBarTitle(headerTitle, displayMode: .inline)))
            ProductHListView(products: products)
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        let productListViewModel: ProductListViewModel = ProductListViewModel()
        ProductListView(products: productListViewModel.productsLists[0].products, headerTitle: productListViewModel.productsLists[0].productsTitle)
    }
}
