//
//  PlayerControlView.swift
//  music-app-ios
//
//  Created by Apple on 2021/11/01.
//

import SwiftUI

struct PlayerControlView: View {
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

struct PlayerControlView_Previews: PreviewProvider {
    static let topItemViewModel: TopItemViewModel = TopItemViewModel()
    static let audio: Audio = topItemViewModel.audioList.audios[0]
    static var audioPlayerViewModel = AudioPlayerViewModel(currentAudio: audio)
    
    static var previews: some View {
        PlayerControlView().environmentObject(audioPlayerViewModel).background(Color("Background")).environment(\.colorScheme, .dark)
        PlayerControlView().environmentObject(audioPlayerViewModel)
    }
}
