//
//  PlayIconView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct PlayIconView: View {
    var size: CGFloat = 50
    var body: some View {
        Circle()
            .fill(Color.white)
          .frame(width: size, height: size).overlay(
            Image(systemName: "play.circle.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.red)
                .frame(width: size, height: size)
        )
        
    }
}

struct PlayIconView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayIconView().environment(\.colorScheme, .dark)
            PlayIconView()
        }
    }
}
