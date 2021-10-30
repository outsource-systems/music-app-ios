//
//  AudioPlayerViewModel.swift
//  music-app-ios
//
//  Created by Apple on 2021/10/30.
//

import Foundation
import Combine
import AVFoundation
import AVKit
import SwiftUI

final class AudioPlayerViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var player: AVPlayer = AVPlayer()
    @Published var playerItem: AVPlayerItem!
    @Published var width: CGFloat = 0
    @Published var finish: Bool = false
    @Published var playing: Bool = false
    @Published var playerCurrentTimeString: String = "0:00"
    @Published var playerDurationString: String = "0:00"
    @Published var observer: NSKeyValueObservation?
    @Published var timer: Timer!
    @Published var url: URL = URL(string: "https://firebasestorage.googleapis.com/v0/b/origify-dev.appspot.com/o/black.mp3?alt=media&token=ea134aac-bde3-496a-bc2e-30f77b23f3fd")!
    @Published var screen: CGFloat = UIScreen.main.bounds.width - (30)
    @Published var volume: Float = 0.5
    var paddingHrizontal: CGFloat = 15
    
    override init() {
        super.init()
        initPlayer(url: self.url)
    }

    func initPlayer(url: URL) {
        let assetKeys = [
                "playable",
                "hasProtectedContent"
            ]
        let asset = AVAsset(url: url)
        self.playerItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: assetKeys)
        self.player = AVPlayer(playerItem: self.playerItem)
        self.observer = self.playerItem.observe(\.status, options: [.new, .old], changeHandler: { (playerItem, _) in
            if playerItem.status == .readyToPlay {
                // 音源の時間を表示
                self.playerDurationString = self.CMTimeToTimeString(cmTime: playerItem.duration)
            }
        })
    }

    func play() {
        print("play")
        if self.player.currentItem != nil {
            print("currentItem is fine")
            self.player.play()
            if self.player.currentItem?.status == .readyToPlay {
                self.playing = true
            }
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
                if self.player.currentItem?.status == .readyToPlay {
                    self.playing = true
                    let value = CMTimeGetSeconds(self.player.currentTime()) / CMTimeGetSeconds(self.player.currentItem!.duration)
                    self.width = self.screen * CGFloat(value)
                    self.playerCurrentTimeString = self.CMTimeToTimeString(cmTime: (self.player.currentTime()))
                }
            }
        }
    }

    func pause() {
        self.player.pause()
        self.playing = false
        self.timer?.invalidate()
    }

    func changeSong(url: URL) {
        self.pause()
        let playerItem = AVPlayerItem(url: url)
        self.player.replaceCurrentItem(with: playerItem)
        self.width = 0
        self.play()
    }

    func onPrev() {
        // 3秒以内の場合
        if CMTimeGetSeconds(self.player.currentTime()) <= 3 {
            // 前の曲
        } else {
            // 再生中の音楽の時間を0にする
            self.player.seek(to: CMTime.zero)
        }
    }

    func onNext() {
        print("next")
    }

    // CMTime型の時間を00:00形式の文字列の時間に変更する
    func CMTimeToTimeString(cmTime: CMTime) -> String {
        return secondsToHoursMinutesSeconds(seconds: Int(floor(CMTimeGetSeconds((cmTime)))))
    }

    // 数字の秒数を文字列の時間に変更する
    func secondsToHoursMinutesSeconds(seconds: Int) -> String {
        let (hour, minits, second) = (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
        if hour == 0 {
            return "\(String(minits)):\(String(format: "%02d", second))"
        }
        return "\(String(format: "%02d", hour)):\(String(format: "%02d", minits)):\(String(format: "%02d", second))"
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.width = 0
        self.playing = false
        // TODO: 次の曲にする
    }
}
