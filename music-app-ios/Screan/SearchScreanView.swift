//
//  SearchScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct SearchScreanView: View {
    let productListViewModel: ProductListViewModel = ProductListViewModel()
    var body: some View {
        let products: [Product] = productListViewModel.productsLists[0].products
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack {
                SearchBarView()
                ScrollMenuView()
                ScrollView {
                    ProductVListView(products: products)
                }
            }.background(Color("Background"))
        }
    }
}

struct SearchScreanView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            SearchScreanView().environment(\.colorScheme, .dark).background(Color.black)
            SearchScreanView()
        }
    }
}
