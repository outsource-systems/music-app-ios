//
//  ProductView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/23.
//

import SwiftUI

struct ProductView: View {
    let product: Product
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        let productViewModel: ProductViewModel = ProductViewModel()
        ProductView(product: productViewModel.product)
    }
}
