//
//  EllipsesIconView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct EllipsesIconView: View {
    var size: CGFloat = 50
    
    var body: some View {
        Image(systemName: "ellipsis.circle.fill")
            .resizable()
            .renderingMode(.template)
            .foregroundColor(.gray)
            .frame(width: size, height: size)
    }
}

struct EllipsesIconView_Previews: PreviewProvider {
    static var previews: some View {
        EllipsesIconView().environment(\.colorScheme, .dark)
        EllipsesIconView()
    }
}
