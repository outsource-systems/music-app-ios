//
//  HomePlayIconView.swift
//  music-app-ios
//
//  Created by Apple on 2021/11/03.
//

import SwiftUI

struct HomePlayIconView: View {
    @EnvironmentObject var topItemViewModel: TopItemViewModel
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    var body: some View {
        let bounds = UIScreen.main.bounds
        let width = bounds.width
        Button(action: {
            audioPlayerViewModel.setCurrentAudio(currentAudioList: topItemViewModel.audioList.audios, currentAudioIndex: 0)
        }) {
            PlayIconView(size: CGFloat(width * 0.13))
        }.padding(.trailing).padding(.top, width * 1.01)
    }
}

struct HomePlayIconView_Previews: PreviewProvider {
    static var previews: some View {
        HomePlayIconView().environmentObject(TopItemViewModel()).environmentObject(AudioPlayerViewModel()).environment(\.colorScheme, .dark)
        HomePlayIconView().environmentObject(TopItemViewModel()).environmentObject(AudioPlayerViewModel())
    }
}
