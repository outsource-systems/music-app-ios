//
//  KingfisherImageView.swift
//  music-app-ios
//
//  Created by Apple on 2021/10/02.
//

import SwiftUI
import Kingfisher

struct KingfisherImageView: View {
    @State var isFetchError: Bool = false
    var size: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    var imageUrl: String?

    var body: some View {
        let bounds = UIScreen.main.bounds
        let screanWidth = bounds.width
        let imageWidth = size ?? width ?? screanWidth
        let imageHeight = size ?? height ?? screanWidth
        let url = URL(string: imageUrl ?? "")
        if (isFetchError || url == nil) {
            Image("DefaultImage")
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
        } else {
            KFImage.url(url).placeholder {
                Image("DefaultImage")
                    .resizable()
                    .frame(width: imageWidth, height: imageHeight)
            }.onFailure { error in
                print(error)
                isFetchError = true
            }.resizable()
            .frame(width: imageWidth, height: imageHeight)
        }
    }
}

struct KingfisherImageView_Previews: PreviewProvider {
    static var previews: some View {
        let imageUrl = "https://firebasestorage.googleapis.com/v0/b/image-89fb3.appspot.com/o/Jungle%20%E3%82%B7%E3%82%99%E3%83%A3%E3%82%B1.jpg?alt=media&token=05bbd0da-749b-4912-a613-5f489ca568f5"
        KingfisherImageView(imageUrl: imageUrl)
        KingfisherImageView()
    }
}
