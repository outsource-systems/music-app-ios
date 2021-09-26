//
//  URLImageView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI
import URLImage

struct URLImageView: View {
    let url: URL
    var body: some View {
        URLImage(url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        let url: URL = URL(string: "https://firebasestorage.googleapis.com/v0/b/image-89fb3.appspot.com/o/Jungle%20%E3%82%B7%E3%82%99%E3%83%A3%E3%82%B1.jpg?alt=media&token=05bbd0da-749b-4912-a613-5f489ca568f5") ?? URL(fileURLWithPath: "")
        URLImageView(url: url)
    }
}
