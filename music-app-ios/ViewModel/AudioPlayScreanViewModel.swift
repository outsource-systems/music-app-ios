//
//  AudioPlayScreanViewModel.swift
//  music-app-ios
//
//  Created by Apple on 2021/10/30.
//

import Foundation
import Combine
import AVFoundation
import AVKit
import SwiftUI

final class AudioPlayScreanViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var player: AVPlayer!
    @Published var playerItem: AVPlayerItem!
    @Published var width: CGFloat = 0
    @Published var finish: Bool = false
    @Published var playing: Bool = false
    @Published var playerCurrentTimeString: String = "0:00"
    @Published var playerDurationString: String = "0:00"
    @Published var observer: NSKeyValueObservation?
    @Published var timer: Timer!
    @Published var url: URL = URL(string: "https://origify-dev.s3.ap-northeast-1.amazonaws.com/black.mp3?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjED0aDmFwLW5vcnRoZWFzdC0xIkgwRgIhALueDGjxYCN1ocU9hZ3%2BPNFErYK0LBs7Z6zYqyQs%2FyFcAiEAuCO2hMStrHVdqIjyoQzzbU2eB5Ze73mGns4Rk3FNlGwq%2FwII1%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARABGgw5NzYzMjY2NjcxOTYiDOzpfQXjK9n6DQIYiirTAlckRcQgodykh2Sg3m20g2bGP4q4%2F%2BsTvvlB5NS3l6nPxA%2FAzENCJkoySnkxFWQxysAktiGfxHiuk3d5BR3elh6XkPGHW6Qsj5jJ1ZYp5HcuFMPzrgq%2Fa5lXzC3Fhk3Jv2Rnr2DRcg6iQvzjO3f3sHu05nDPmlgTKWcKYwiKrABxBhYoYH7xJ5OdQxuglIVTQXNcTqysVb94xGUpLIUGrb7qUCUDIKTOln9P6PKdm4PZKyD9Z8LnOGtJEKQNX6DauYP301oSKE9m1BgMZXa8%2Fg9XeePruCJKqaZlefc8Z7kgSKTyNLh17KvFj6HdqPfQ4gFgToWXd%2BgRoPBAecTHcmNMN%2FdDGHweTladyXu3EvRi%2F7IMNXA1LxNJG0H9THjMk9JxcWy0qwDHpD7ePm947Qqsi68Ns5PnmFctR1wpU6b%2Bmz4SkH19zRuAd3fgucHlPXvADDDygvWLBjqyAgdjQAxTX5peQWFoFB7NvIwyrvHxl6RKgq%2B69WlPpKI0Ozkb8vJ4s0creDw7BEZi%2BT00NCUOChlK6ED%2FAA7FI73jpWefxoKaUk%2B0EkCWxqTXJBNpjF5dakmUgXwP9ug0ktmnuutg8gvIYHLYpybInZfj6uflL5IVJyleXe91JSZgf5yIxrL4FhxNpQnZpg9EiAATlPG%2BEj7ZzEj5t0SFdTllDjBl2LqRuC%2BQaFk9W8r2gumqI0xksQUmfNwGCYDXxyqk%2Bv8B4%2FBQPLeoJvEhpthi7KIxbJJnR%2FbiY9%2B5Ojj9PDJhBMz1aYxP1UPM0JDDUQ4f4YPafvAt639fH9QQQq5iqP0r1nycSOhYZW4zxCOqr%2BeckzhCIe0OkjPlMZq61%2FCNRJyoAwsfTotHgOFayKv5Cw%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20211030T133606Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIA6GUM2VO6FAMCV3G4%2F20211030%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Signature=971e37e6c6387994c5e115d0e481af493e01f5e7c585acaf15b3d406cc85c227")!
    @Published var screen: CGFloat = 0
    @Published var volume: Float = 0.5
    var paddingHrizontal: CGFloat = 15

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
        if self.player.currentItem != nil {
            self.player.play()
            if self.player.currentItem?.status == .readyToPlay {
                self.playing = true
            }
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
                if self.player.currentItem?.status == .readyToPlay {
                    self.playing = true
                    let value = CMTimeGetSeconds(self.player.currentTime()) / CMTimeGetSeconds(self.player.currentItem!.duration)
                    self.width = self.screen * CGFloat(value)
                    self.playerCurrentTimeString = self.CMTimeToTimeString(cmTime: (self.player?.currentTime())!)
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
