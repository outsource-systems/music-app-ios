//
//  ImageContentView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct ImageContentView: View {
    let url: String?
    let size: CGFloat
    @Environment(\.imageCache) var cache: ImageCache
        
    init(url: String? = nil, size: CGFloat = 200) {
        self.url = url
        self.size = size
    }
    var body: some View {
        if (url != nil) {
            ImageView(
                url: URL(string: url ?? "")!,
                cache: cache,
                placeholder: IndicatorView(isAnimating: true)
            )
            .frame(width: size, height: size)
        }
    }
}

struct ImageContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageContentView(url: "https://firebasestorage.googleapis.com/v0/b/image-89fb3.appspot.com/o/Jungle%20%E3%82%B7%E3%82%99%E3%83%A3%E3%82%B1.jpg?alt=media&token=05bbd0da-749b-4912-a613-5f489ca568f5")
    }
}
