//
//  ListItemView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/25.
//

import SwiftUI

struct ListItemView: View {
    var audio: Audio
    
    var body: some View {
            VStack {
                Rectangle()
                    .frame(height: 1)
                    .clipped()
                    .foregroundColor(Color(.systemGray6))
                    .padding(.leading, 23)
                HStack(spacing: 0) {
                    if audio.isFavorite {
                        Image(systemName: "star.fill")
                            .font(.caption2)
                            .foregroundColor(Color.secondary)
                            .frame(width: 15, height: 15)
                    } else {
                        Spacer().frame(width: 15, height: 15)
                    }
                    Text(String(audio.id)) // audio.sortNumber 曲順に変更する
                        .frame(width: 16, alignment: .trailing)
                        .clipped()
                        .padding(.trailing, 15)
                        .foregroundColor(Color("Text"))
                    VStack(alignment: .leading) {
                        Text(audio.title)
                    }
                    Spacer()
                    AddIconView(size: 30)
                }
                .padding(.horizontal, 5)
                .frame(height: 47)
                .clipped()
            }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static let topItemViewModel: TopItemViewModel = TopItemViewModel()
    static let audio: Audio = topItemViewModel.audioList.audios[0]
    static let audios: [Audio] = topItemViewModel.audioList.audios
    static var previews: some View {
        ListItemView(audio: audio).environment(\.colorScheme, .dark).background(Color(.black))
        ListItemView(audio: audio)
    }
}
