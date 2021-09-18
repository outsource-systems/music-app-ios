//
//  PlayAndShuffleButtonView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct PlayAndShuffleButtonView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            HStack {
                RoundedRectangle(cornerRadius: 11, style: .continuous)
                    .frame(width: 158, height: 46)
                    .clipped()
                    .foregroundColor(Color(.secondarySystemFill))
                    .overlay(HStack {
                        Image(systemName: "play.fill")
                        Text("Play")
                            .font(.system(size: 17, weight: .semibold, design: .default))
                    }
                    .foregroundColor(Color.pink), alignment: .center)
                Spacer()
                RoundedRectangle(cornerRadius: 11, style: .continuous)
                    .frame(width: 158, height: 46)
                    .clipped()
                    .foregroundColor(Color(.secondarySystemFill))
                    .overlay(HStack {
                        Image(systemName: "shuffle")
                        Text("Shuffle")
                            .font(.system(size: 17, weight: .semibold, design: .default))
                    }
                    .foregroundColor(Color.pink), alignment: .center)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
    }
}

struct PlayAndShuffleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayAndShuffleButtonView().environment(\.colorScheme, .dark)
        PlayAndShuffleButtonView()
    }
}
