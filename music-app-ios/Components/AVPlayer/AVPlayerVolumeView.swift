//
//  AVPlayerVolumeView.swift
//  music-app-ios
//
//  Created by Apple on 2021/11/01.
//

import SwiftUI

struct AVPlayerVolumeView: View {
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "speaker.fill").foregroundColor(Color("Text").opacity(0.6))
            Slider(value: self.$audioPlayerViewModel.player.volume, in: 0...1)
                .padding(.horizontal)
                .accentColor(Color("Text").opacity(0.6))
            Image(systemName: "speaker.wave.2.fill").foregroundColor(Color("Text").opacity(0.6))
        }
    }
}

struct AVPlayerVolumeView_Previews: PreviewProvider {
    static let topItemViewModel: TopItemViewModel = TopItemViewModel()
    static let audio: Audio = topItemViewModel.audioList.audios[0]
    static var audioPlayerViewModel = AudioPlayerViewModel(currentAudioList: topItemViewModel.audioList.audios, currentAudioIndex: 0)
    
    static var previews: some View {
        AVPlayerVolumeView().environmentObject(audioPlayerViewModel).background(Color("Background")).environment(\.colorScheme, .dark)
        AVPlayerVolumeView().environmentObject(audioPlayerViewModel)
    }
}
