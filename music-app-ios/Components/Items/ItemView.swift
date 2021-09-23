//
//  ItemView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct ItemView: View {
    let title: String
    let size: CGFloat
    let imageUrl: String?
    
    init (title: String = "No Title", size: CGFloat = 150, imageUrl: String? = nil) {
        self.title = title
        self.size = size
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if (imageUrl != nil) {
                ImageCornerRadiusView(size: size, imageUrl: imageUrl)
            } else {
                ItemSampleView(size: size)
            }
            Text(title)
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        let audioViewModel: AudioViewModel = AudioViewModel()
        Group {
            ItemView(title: audioViewModel.audio.title, size: 150,  imageUrl: audioViewModel.audio.posterFile)
        }
    }
}
