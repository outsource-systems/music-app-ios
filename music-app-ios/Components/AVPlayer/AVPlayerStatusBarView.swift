//
//  AVPlayerStatusBarView.swift
//  music-app-ios
//
//  Created by Apple on 2021/11/01.
//

import SwiftUI

struct AVPlayerStatusBarView: View {
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    @State private var showingSheet = false
    
    var body: some View {
        let audio = audioPlayerViewModel.currentAudio
        Button(action: { self.audioPlayerViewModel.showPlayer() })
           {
            HStack(spacing: 0) {
                ImageCornerRadiusView(size: 48, imageUrl: audio?.posterFile ?? "", isShowShadow: true).padding(.trailing)
                Text(audio?.title ?? "")
                Spacer()
                HStack(spacing: 24) {
                    Button(action: {
                        audioPlayerViewModel.playing ? self.audioPlayerViewModel.pause() : self.audioPlayerViewModel.play()
                    }) {
                        Image(systemName: audioPlayerViewModel.playing ? "pause.fill" : "play.fill")
                            .font(.system(size: 21, weight: .regular, design: .default))
                    }
                    
                    Button(action: {
                        self.audioPlayerViewModel.onNext()
                    }) {
                        Image(systemName: "forward.fill")
                            .font(.system(size: 21, weight: .regular, design: .default))
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 7)
            .background(Color("Background")).opacity(0.9)
        }.foregroundColor(Color("Text"))
        .sheet(isPresented: self.$audioPlayerViewModel.isShowPlayer) {
            AudioPlayScreanView().environmentObject(audioPlayerViewModel)
         }
    }
}

struct AVPlayerStatusBarView_Previews: PreviewProvider {
    static let topItemViewModel: TopItemViewModel = TopItemViewModel()
    static let audio: Audio = topItemViewModel.audioList.audios[0]
    static var audioPlayerViewModel = AudioPlayerViewModel(currentAudioList: topItemViewModel.audioList.audios, currentAudioIndex: 0)
    
    static var previews: some View {
        Group {
            AVPlayerStatusBarView().environment(\.colorScheme, .dark).environmentObject(audioPlayerViewModel)
            AVPlayerStatusBarView().environment(\.colorScheme, .dark).environmentObject(AudioPlayerViewModel())
            AVPlayerStatusBarView().environmentObject(audioPlayerViewModel)
            AVPlayerStatusBarView().environmentObject(AudioPlayerViewModel())
        }
        .previewLayout(.fixed(width: 350, height: 70))
    }
}
