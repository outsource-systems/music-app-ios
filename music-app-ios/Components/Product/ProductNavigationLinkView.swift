//
//  ProductNavigationLinkView.swift
//  music-app-ios
//
//  Created by Apple on 2021/10/01.
//

import SwiftUI

struct ProductNavigationLinkView: View {
    var product: Product
    var size: CGFloat = 150
    var body: some View {
        NavigationLink(destination: ProductView(product: product).toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                                Button(action: {}) {
                                    HStack {
                                        Text("+ Add")
                                    }
                                }
                            }
            ToolbarItem(placement: .navigationBarTrailing){
                                Button(action: {}) {
                                    Image(systemName: "ellipsis")
                                }
                            }
        }) {
            ItemView(title: product.productTitle, size: size, imageUrl: product.posterFile)
                .navigationBarHidden(false)
        }
    }
}

struct ProductNavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        let productListViewModel: ProductListViewModel = ProductListViewModel()
        ProductNavigationLinkView(product: productListViewModel.productsLists[0].products[0])
    }
}
