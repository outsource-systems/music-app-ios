//
//  ItemSampleView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct ItemSampleView: View {
    let size: CGFloat
    
    init(size: CGFloat = 150) {
        self.size = size
    }
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .bottomLeading, endPoint: .topTrailing)
            .frame(width: size, height: size)
            .clipped()
            .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct ItemSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSampleView()
    }
}
