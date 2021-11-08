//
//  ProductItemList.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/25.
//

import SwiftUI

struct ProductItemList: View {
    var items: [Audio]
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                ForEach(items, id: \.self) { item in
                    AudioListItemView(title: item.title, number: item.sortNumber ?? 0)
                }
            }
            .padding(.top, 30)
        }
    }
}

struct ProductItemList_Previews: PreviewProvider {
    static var previews: some View {
        let productViewModel: ProductViewModel = ProductViewModel()
        ProductItemList(items: productViewModel.product.audios ?? []).environment(\.colorScheme, .dark)
        ProductItemList(items: productViewModel.product.audios ?? [])
    }
}
