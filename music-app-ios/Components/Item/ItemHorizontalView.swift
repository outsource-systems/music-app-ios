//
//  ItemHorizontalView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct ItemHorizontalView: View {
    var audio: Audio
    var size: CGFloat = 50
    var name: String = "Album"
    var relaseDate: String = "2020"
    
    var body: some View {
            VStack(spacing: 3) {
                HStack {
                    Spacer().frame(width: size).padding(.horizontal, 5)
                    VStack {
                        Divider()
                    }
                    Spacer().frame(width: 10)
                }.padding(0)
                HStack {
                    ImageCornerRadiusView(size: size, imageUrl: audio.posterUrl)
                    VStack {
                        HStack {
                            Text(audio.title)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        HStack {
                            Text("\(name)・\(relaseDate)")
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color("SubText"))
                            Spacer()
                        }
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "ellipsis").padding(.trailing).accentColor(Color("Text"))
                    }
                }.padding(.vertical, 3).padding(.leading, 5)
            }
    }
}

struct ItemHorizontalView_Previews: PreviewProvider {
    static let topItemViewModel: TopItemViewModel = TopItemViewModel()
    static let audio: Audio = topItemViewModel.audioList.audios[0]
    
    static var previews: some View {
        ItemHorizontalView(audio: audio).background(Color("Background")).environment(\.colorScheme, .dark)
        ItemHorizontalView(audio: audio)
    }
}
