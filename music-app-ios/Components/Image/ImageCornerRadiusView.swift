//
//  ImageCornerRadiusView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct ImageCornerRadiusView: View {
    let size: CGFloat
    var imageUrl: String?
    var isShowShadow: Bool = false

    var body: some View {
        let cornerRadius = CGFloat(Int(size * 0.075))
        if (imageUrl != nil) {
            if (isShowShadow) {
                ImageView(size: size, imageUrl: imageUrl).cornerRadius(cornerRadius).shadow(color: Color("Text").opacity(0.2), radius: 8, x: 0, y: 14)
            } else {
                ImageView(size: size, imageUrl: imageUrl).cornerRadius(cornerRadius)
            }
        } else {
            if (isShowShadow) {
                Image("DefaultImage").resizable().frame(width: size, height: size).cornerRadius(cornerRadius).shadow(color: Color("Text").opacity(0.2), radius: 8, x: 0, y: 14)
            } else {
                Image("DefaultImage").resizable().frame(width: size, height: size).cornerRadius(cornerRadius)
            }
        }
    }
}

struct ImageCornerRadiusView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCornerRadiusView(size: 200, imageUrl:  "https://firebasestorage.googleapis.com/v0/b/image-89fb3.appspot.com/o/Jungle%20%E3%82%B7%E3%82%99%E3%83%A3%E3%82%B1.jpg?alt=media&token=05bbd0da-749b-4912-a613-5f489ca568f5")
        ImageCornerRadiusView(size: 200, imageUrl:  "https://firebasestorage.googleapis.com/v0/b/image-89fb3.appspot.com/o/Jungle%20%E3%82%B7%E3%82%99%E3%83%A3%E3%82%B1.jpg?alt=media&token=05bbd0da-749b-4912-a613-5f489ca568f5", isShowShadow: true)
        ImageCornerRadiusView(size: 200)
        ImageCornerRadiusView(size: 200, isShowShadow: true)
    }
}
