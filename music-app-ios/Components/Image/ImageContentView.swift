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
        ImageContentView(url: "https://firebasestorage.googleapis.com/v0/b/image-3a2a9.appspot.com/o/Jungle%20%E3%82%B7%E3%82%99%E3%83%A3%E3%82%B1.png?alt=media&token=7af1951a-98d5-456f-8526-2a8f42d9a157")
    }
}
