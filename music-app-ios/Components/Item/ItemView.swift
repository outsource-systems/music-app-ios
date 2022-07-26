//
//  ItemView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct ItemView: View {
    let name: String
    let size: CGFloat
    let imageUrl: String?
    
    init (name: String = "No Title", size: CGFloat = 150, imageUrl: String? = nil) {
        self.name = name
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
            Text(name).foregroundColor(Color("Text"))
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        let audioViewModel: AudioViewModel = AudioViewModel()
        Group {
            ItemView(name: audioViewModel.audio.name, size: 150,  imageUrl: audioViewModel.audio.posterUrl)
        }
    }
}
