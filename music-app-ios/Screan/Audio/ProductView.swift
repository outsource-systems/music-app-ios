//
//  ProductView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/23.
//

import SwiftUI

struct ProductView: View {
    // TODO Productを引数で渡すようにする
    var product: Product = ProductViewModel().product
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: true) {
                ProductCoverView(imageUrl: product.posterUrl, title: product.name, artists: product.artists ?? [], category: product.category ?? "", releaseDate: product.releaseDate)
                    PlayAndShuffleButtonView()
                ProductItemListView(items: product.audios ?? [])
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        // let productViewModel: ProductViewModel = ProductViewModel()
        ProductView()
    }
}
