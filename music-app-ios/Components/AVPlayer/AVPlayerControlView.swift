//
//  AVPlayerControlView.swift
//  music-app-ios
//
//  Created by Apple on 2021/11/01.
//

import SwiftUI

struct AVPlayerControlView: View {
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    
    var body: some View {
        HStack(spacing: UIScreen.main.bounds.width / 5 - 30) {
            Button(action: {
                self.audioPlayerViewModel.onPrev()
            }) {
                Image(systemName: "backward.fill")
            }
            Button(action: {
                if self.audioPlayerViewModel.playing {
                    self.audioPlayerViewModel.pause()
                } else {
                    self.audioPlayerViewModel.play()
                }
            }) {
                Image(systemName: self.audioPlayerViewModel.playing ? "pause.fill" : "play.fill")
            }
            Button(action: {
                self.audioPlayerViewModel.onNext()
            }) {
                Image(systemName: "forward.fill")
            }
        }.padding(.vertical, 25)
        .foregroundColor(Color("Text"))
        .font(.largeTitle)
    }
}

struct AVPlayerControlView_Previews: PreviewProvider {
    static let topItemViewModel: TopItemViewModel = TopItemViewModel()
    static let audio: Audio = topItemViewModel.items[0]
    static var audioPlayerViewModel = AudioPlayerViewModel(currentAudioList: topItemViewModel.items, currentAudioIndex: 0)
    
    static var previews: some View {
        AVPlayerControlView().environmentObject(audioPlayerViewModel).background(Color("Background")).environment(\.colorScheme, .dark)
        AVPlayerControlView().environmentObject(audioPlayerViewModel)
    }
}
