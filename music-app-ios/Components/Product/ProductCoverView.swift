//
//  ProductCoverView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/25.
//

import SwiftUI

struct ProductCoverView: View {
    var imageUrl: String
    var title: String
    var artists: [Artist]
    var genre: String
    var releaseDate: String
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                ImageCornerRadiusView(size: 223, imageUrl: imageUrl)
                VStack(spacing: 1) {
                    Text(title)
                        .font(.system(size: 20, weight: .medium, design: .default))
                    Text(artists.first!.name)
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(Color.pink)
                    Text("\(genre) • \(releaseDate)")
                        .font(.system(size: 11, weight: .medium, design: .default))
                        .offset(x: 0, y: 4)
                        .foregroundColor(Color.secondary)
                }
                .padding(.top, 17)
            }
        }
    }
}

struct ProductCoverView_Previews: PreviewProvider {
    static var previews: some View {
        let productViewModel: ProductViewModel = ProductViewModel()
        ProductCoverView(imageUrl: productViewModel.product.posterFile, title: productViewModel.product.productTitle, artists: productViewModel.product.productArtists ?? [], genre: productViewModel.product.genre ?? "", releaseDate: productViewModel.product.productReleaseDate).environment(\.colorScheme, .dark)
    }
}
