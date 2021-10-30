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
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            Image("SampleAudioImage")
                .resizable()
                .blur(radius: 120.0, opaque: false)
            VStack {
                ItemSampleView(size: self.audioPlayerViewModel.screen * 0.9).padding(.top)
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
                        EllipsesIconView(size: 30)
                    }.padding(.bottom, 30).padding(.horizontal, 35)
                )
                Spacer()
                ZStack(alignment: .leading) {
                    Capsule().fill(Color("Text").opacity(0.2)).frame(height: 8).gesture(dragGesture)
                    Capsule().fill(Color("Text").opacity(0.6)).frame(width: self.audioPlayerViewModel.width, height: 8).gesture(dragGesture)
                }.padding(.horizontal, paddingHrizontal)
                HStack {
                    Text(verbatim: self.audioPlayerViewModel.playerCurrentTimeString).padding()
                    Spacer()
                    Text(verbatim: self.audioPlayerViewModel.playerDurationString).padding()
                }.foregroundColor(Color("Text"))
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
                HStack {
                    Image(systemName: "speaker.fill").foregroundColor(Color("Text").opacity(0.6))
                    Slider(value: self.$audioPlayerViewModel.player.volume, in: 0...1)
                        .padding(.horizontal)
                        .accentColor(Color("Text").opacity(0.6))
                    Image(systemName: "speaker.wave.2.fill").foregroundColor(Color("Text").opacity(0.6))
                }.padding(.top, 40)
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "quote.bubble")
                    Spacer()
                    Image(systemName: "list.dash")
                    Spacer()
                }
            }.padding()
        }
    }
}

struct AudioPlayScreanView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayScreanView().environmentObject(AudioPlayerViewModel()).environment(\.colorScheme, .dark)
        AudioPlayScreanView().environmentObject(AudioPlayerViewModel())
    }
}
