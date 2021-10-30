//
//  EllipsesIconView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct EllipsesIconView: View {
    var size: CGFloat = 150
    
    var body: some View {
        Circle()
            .fill(Color("Text").opacity(0.2))
            .frame(width: size, height: size)
            .overlay(
                Image(systemName: "ellipsis")
                    .font(.system(size: size * 0.7)).padding()
                    .foregroundColor(.white)
            )
    }
}

struct EllipsesIconView_Previews: PreviewProvider {
    static var previews: some View {
        EllipsesIconView().background(Color("Background")).environment(\.colorScheme, .dark)
        EllipsesIconView()
    }
}
