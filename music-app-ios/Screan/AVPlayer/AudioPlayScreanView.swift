//
//  AudioPlayScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI
import AVKit

struct AudioPlayScreanView: View {
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    var paddingHrizontal: CGFloat = 15
    
    var body: some View {
        let audio = audioPlayerViewModel.currentAudio
        let artistName = audio?.artists.map { $0.name }.joined(separator: " & ")
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            ImageView(imageUrl: audio?.posterUrl)
                .blur(radius: 120.0, opaque: false)
            VStack {
                VStack {
                    if self.audioPlayerViewModel.currentPlayerViewType.rawValue == "main" {
                        VStack {
                            ImageCornerRadiusView(size: self.audioPlayerViewModel.playing ? self.audioPlayerViewModel.playImageSize : self.audioPlayerViewModel.pauseImageSize, imageUrl: audio?.posterUrl).padding(.vertical).animation(.default)
                        }
                    } else if self.audioPlayerViewModel.currentPlayerViewType.rawValue == "list" {
                        ScrollView {
                            ForEach(Array(audioPlayerViewModel.currentAudioList.enumerated()), id: \.offset) { index, audio in
                                Button(action: {
                                    audioPlayerViewModel.setCurrentAudioFromAudio(currentAudio: audio)
                                }) {
                                    ItemHorizontalView(audio: audio)
                                }.accentColor(Color("Text"))
                            }
                        }
                    }
                }.frame(height: self.audioPlayerViewModel.screen).animation(.default)
                VStack {
                    HStack {
                        Text(audio!.name)
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }.padding(.horizontal, 40)
                    HStack {
                        Text(artistName!)
                            .font(.title2)
                        Spacer()
                    }.padding(.horizontal, 40)
                }.overlay(
                    HStack {
                        Spacer()
                        EllipsesIconView(size: 30)
                    }.padding()
                )
                Spacer()
                AVPlayerTImeControlView()
                AVPlayerControlView()
                AVPlayerVolumeView().padding(.vertical, 40)
                AVPlayerButtonMenuView()
            }.padding()
        }
    }
}

struct AudioPlayScreanView_Previews: PreviewProvider {
    static let topItemViewModel: TopItemViewModel = TopItemViewModel()
    static let audio: Audio = topItemViewModel.items[0]
    static var audioPlayerViewModel = AudioPlayerViewModel(currentAudioList: topItemViewModel.items, currentAudioIndex: 0)
    
    static var previews: some View {
        AudioPlayScreanView().environmentObject(audioPlayerViewModel).environment(\.colorScheme, .dark)
        AudioPlayScreanView().environmentObject(audioPlayerViewModel)
    }
}
