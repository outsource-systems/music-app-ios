//
//  PlayIconView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct PlayIconView: View {
    var body: some View {
        Circle()
            .fill(Color.white)
          .frame(width:50, height: 50).overlay(
            Image(systemName: "play.circle.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.red)
                .frame(width: 50, height: 50)
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
