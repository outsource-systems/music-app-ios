//
//  AudioPlayScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI
import AVKit

struct AudioPlayScreanView: View {
    @State var data: Data = .init(count: 0)
    @State var title = ""
    @State var player: AVAudioPlayer!
    @State var playing = false
    @State var width: CGFloat = 0
    @State var songs = ["black", "bad"]
    @State var current = 0
    @State var finish = false
    @State var del = AVdelegate()
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged({ (value) in
                let locationX = value.location.x
                self.width = locationX
            }).onEnded({ (value) in
                let locationX = value.location.x
                let screen = UIScreen.main.bounds.width - 30
                let percent = locationX / screen
                self.player.currentTime = Double(percent) * self.player.duration
            })
    }
    
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            Image("SampleAudioImage")
                .resizable()
                .blur(radius: 120.0, opaque: false)
            VStack {
                ItemSampleView(size: 350).padding(.top)
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
                ZStack(alignment: .leading) {
                    Capsule().fill(Color.black.opacity(0.08)).frame(height: 8).gesture(dragGesture)
                    Capsule().fill(Color.red).frame(width: self.width, height: 8).gesture(dragGesture)
                }
                .padding(.top)
                HStack(spacing: UIScreen.main.bounds.width / 5 - 30) {
                    Button(action: {
                        if self.current > 0 {

                            self.current -= 1

                            self.changeSongs()
                        }
                    }) {
                        Image(systemName: "backward.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .font(.title)
                    }.accentColor(Color("Text"))
                    Button(action: {
                        if (self.player.isPlaying) {
                                self.player.pause()
                                self.playing = false
                        } else {
                            if self.finish {
                                self.player.currentTime = 0
                                self.width = 0
                                self.finish = false
                            }
                            self.player.play()
                            self.playing = true
                        }
                    }) {
                            Image(systemName: self.playing && !self.finish ? "pause.fill" : "play.fill").resizable()
                                .frame(width: 40, height: 40)
                                .font(.title)
                    }.accentColor(Color("Text"))
                    Button(action: {
                        if self.songs.count - 1 != self.current {
                            self.current += 1
                            self.changeSongs()
                        }
                    }) {
                        Image(systemName: "forward.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .font(.title)
                    }.accentColor(Color("Text"))
                }.padding(.top, 80)
                Spacer()
                VolumeSliderView().padding(.horizontal, 30).padding(.top, 70)
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "quote.bubble")
                    Spacer()
                    Image(systemName: "list.dash")
                    Spacer()
                }
                Spacer()
            }.padding()
        }.onAppear {
            initSong()
        }
    }
    
    func getData() {
        let asset = AVAsset(url: self.player.url!)
        for metaData in asset.commonMetadata {
            if metaData.commonKey?.rawValue == "artwork"{
                let data = metaData.value as? Data
                self.data = data ?? Data()
            }

            if metaData.commonKey?.rawValue == "title"{
                let title = metaData.value as? String
                self.title = title ?? String()
            }
        }
    }
    
    func initSong() {
        let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        self.player.delegate = self.del
        self.data = .init(count: 0)
        self.title = ""
        self.player.prepareToPlay()
        self.getData()
    }

    func changeSongs() {
        initSong()
        self.playing = true
        self.finish = false
        self.width = 0
        self.player.play()
    }
}

struct AudioPlayScreanView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayScreanView().environment(\.colorScheme, .dark)
        AudioPlayScreanView()
    }
}

class AVdelegate: NSObject, AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    }
}
