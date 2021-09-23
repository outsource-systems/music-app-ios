//
//  AudioPlayScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct AudioPlayScreanView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .frame(width: 32, height: 4.5)
                .clipped()
                .padding(.vertical, 10)
                .foregroundColor(Color(.tertiaryLabel))
                .frame(maxWidth: .infinity)
                .clipped()
            ItemSampleView(size: 350)
            HStack {
                Text("Title")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }.padding(.horizontal, 40)
            HStack {
                Text("Artist")
                    .font(.title2)
                Spacer()
            }.padding(.horizontal, 40).overlay(
                HStack {
                    Spacer()
                    EllipsesIconView(size: 30, color: Color("Text"))
                }.padding(.bottom, 30).padding(.horizontal, 35)
            )
            HStack {
                Spacer()
                Image(systemName: "backward.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                Spacer()
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                Spacer()
                Image(systemName: "forward.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                Spacer()
            }.padding(.top, 80)
            Spacer()
            VolumeSliderView().padding(.horizontal, 30).padding(.top, 70)
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "quote.bubble")
                Spacer()
                Image(systemName: "list.dash")
                Spacer()
            }
            Spacer()
        }
    }
}

struct AudioPlayScreanView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayScreanView().background(Color("Background")).environment(\.colorScheme, .dark)
        AudioPlayScreanView()
    }
}
