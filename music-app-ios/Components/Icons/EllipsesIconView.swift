//
//  EllipsesIconView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct EllipsesIconView: View {
    let size: CGFloat
    let color: Color
    
    init(size: CGFloat = 50, color: Color = Color("ButtonLabel")) {
        self.size = size
        self.color = color
    }
    
    var body: some View {
        Circle()
            .fill(color)
          .frame(width: size, height: size).overlay(
            Image(systemName: "ellipsis.circle.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color("ButtonBackground"))
                .frame(width: size, height: size)
           )
    }
}

struct EllipsesIconView_Previews: PreviewProvider {
    static var previews: some View {
        EllipsesIconView(color: Color("Text"))
        EllipsesIconView()
    }
}
