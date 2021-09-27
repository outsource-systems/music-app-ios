//
//  ItemSampleView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct ItemSampleView: View {
    let size: CGFloat
    var cornerRadius: CGFloat
    let assetImageName: String
    
    init(size: CGFloat = 150, assetImageName: String = "SampleAudioImage") {
        self.size = size
        self.cornerRadius = CGFloat(Int(size * 0.075))
        self.assetImageName = assetImageName
    }
    
    var body: some View {
        Image(assetImageName)
            .resizable()
            .frame(width: size, height: size)
            .cornerRadius(cornerRadius)
    }
}

struct ItemSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSampleView()
    }
}
