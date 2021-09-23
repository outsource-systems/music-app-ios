//
//  ImageCornerRadiusView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct ImageCornerRadiusView: View {
    let size: CGFloat
    var cornerRadius: CGFloat
    var imageUrl: String?
    var isShowShadow: Bool
    
    init(size: CGFloat, imageUrl: String? = nil, isShowShadow: Bool = false) {
        self.size = size
        self.cornerRadius = CGFloat(Int(size * 0.075))
        self.imageUrl = imageUrl
        self.isShowShadow = isShowShadow
    }

    var body: some View {
        if (imageUrl != nil) {
            if (isShowShadow) {
                ImageContentView(url: imageUrl,
                                 size: size).cornerRadius(cornerRadius).shadow(color: Color("Text").opacity(0.2), radius: 8, x: 0, y: 14)
            } else {
                ImageContentView(url: imageUrl,
                                 size: size).cornerRadius(cornerRadius)
            }
        }
    }
}

struct ImageCornerRadiusView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCornerRadiusView(size: 200, imageUrl:  "https://firebasestorage.googleapis.com/v0/b/image-3a2a9.appspot.com/o/Jungle%20%E3%82%B7%E3%82%99%E3%83%A3%E3%82%B1.png?alt=media&token=7af1951a-98d5-456f-8526-2a8f42d9a157")
        ImageCornerRadiusView(size: 200, imageUrl:  "https://firebasestorage.googleapis.com/v0/b/image-3a2a9.appspot.com/o/Jungle%20%E3%82%B7%E3%82%99%E3%83%A3%E3%82%B1.png?alt=media&token=7af1951a-98d5-456f-8526-2a8f42d9a157", isShowShadow: true)
    }
}
