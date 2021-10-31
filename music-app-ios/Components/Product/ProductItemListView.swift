//
//  ProductItemListView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/25.
//

import SwiftUI

struct ProductItemListView: View {
    var items: [Audio]
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                ForEach(items, id: \.self) { item in
                    ListItemView(audio: item)
                }
            }
            .padding(.top, 30)
        }
    }
}

struct ProductItemListView_Previews: PreviewProvider {
    static var previews: some View {
        let productViewModel: ProductViewModel = ProductViewModel()
        ProductItemListView(items: productViewModel.product.audios ?? []).environment(\.colorScheme, .dark)
        ProductItemListView(items: productViewModel.product.audios ?? [])
    }
}
