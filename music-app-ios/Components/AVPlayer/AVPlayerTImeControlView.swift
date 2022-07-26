//
//  AVPlayerTImeControlView.swift
//  music-app-ios
//
//  Created by Apple on 2021/11/01.
//

import SwiftUI
import AVKit

struct AVPlayerTImeControlView: View {
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    var paddingHrizontal: CGFloat = 15
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged({ (value) in
                if self.audioPlayerViewModel.player.currentItem == nil { return }
                // ドラックしている時
                self.audioPlayerViewModel.width = value.location.x
            }).onEnded({ (value) in
                if self.audioPlayerViewModel.player.currentItem == nil { return }
                // ドラックが完了した時
                let percent: Float64 = Float64(value.location.x / self.audioPlayerViewModel.screen)
                let seekTime: CMTime = CMTimeMultiplyByFloat64(self.audioPlayerViewModel.player.currentItem!.duration, multiplier: percent)
                self.audioPlayerViewModel.player.seek(to: seekTime)
            })
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Capsule().fill(Color("Text").opacity(0.2)).frame(height: 8).gesture(dragGesture)
                Capsule().fill(Color("Text").opacity(0.6)).frame(width: self.audioPlayerViewModel.width, height: 8).gesture(dragGesture)
            }.padding(.horizontal, paddingHrizontal)
            HStack {
                Text(verbatim: self.audioPlayerViewModel.playerCurrentTimeString).padding()
                Spacer()
                Text(verbatim: self.audioPlayerViewModel.playerDurationString).padding()
            }.foregroundColor(Color("Text").opacity(0.4))
        }
    }
}

struct AVPlayerTImeControlView_Previews: PreviewProvider {
    static let topItemViewModel: TopItemViewModel = TopItemViewModel()
    static let audio: Audio = topItemViewModel.items[0]
    static var audioPlayerViewModel = AudioPlayerViewModel(currentAudioList: topItemViewModel.items, currentAudioIndex: 0)
    
    static var previews: some View {
        AVPlayerTImeControlView().environmentObject(audioPlayerViewModel).background(Color("Background")).environment(\.colorScheme, .dark)
        AVPlayerTImeControlView().environmentObject(audioPlayerViewModel)
    }
}
