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
import MediaPlayer

final class AudioPlayerViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var player: AVPlayer = AVPlayer()
    @Published var playerItem: AVPlayerItem!
    @Published var width: CGFloat = 0
    @Published var playing: Bool = false
    @Published var playerCurrentTimeString: String = "0:00"
    @Published var playerDurationString: String = "0:00"
    @Published var observer: NSKeyValueObservation?
    @Published var timer: Timer!
    @Published var screen: CGFloat = UIScreen.main.bounds.width - (30)
    @Published var volume: Float = 0.5
    @Published var currentAudio: Audio!
    @Published var currentAudioList: [Audio]!
    @Published var totalAudioList: [Audio]!
    @Published var totalAudioIndex: Int!
    @Published var isShowPlayer = false
    @Published var playImageSize: CGFloat! = UIScreen.main.bounds.width * 0.8
    @Published var pauseImageSize: CGFloat! = UIScreen.main.bounds.width * 0.65
    @Published var currentPlayerViewType: PlayerViewType = .main
    private var nowPlayingInfo = [String : Any]()
    var paddingHrizontal: CGFloat = 15
    var assetKeys = ["playable", "hasProtectedContent"]
    
    enum  PlayerViewType: String {
        case main = "main"
        case list = "list"
        case lyrics = "lyrics"
    }
    
    init(currentAudioList: [Audio], currentAudioIndex: Int) {
        super.init()
        self.currentAudioList = currentAudioList
        self.totalAudioIndex = currentAudioIndex
        self.currentAudio = self.currentAudioList[self.totalAudioIndex]
        self.replasePlayer(url: URL(string: self.currentAudio.url!)!)
    }
    
    override init() {
        super.init()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
        setupRemoteTransportControls()
    }
    
    func replasePlayer(url: URL)  {
        let asset = AVAsset(url: url)
        self.playerItem = AVPlayerItem(asset: asset, automaticallyLoadedAssetKeys: self.assetKeys)
        self.player = AVPlayer(playerItem: self.playerItem)
        self.observer = self.playerItem.observe(\.status, options: [.new, .old], changeHandler: { (playerItem, _) in
            if playerItem.status == .readyToPlay {
                // 音源の時間を表示
                self.playerDurationString = self.CMTimeToTimeString(cmTime: playerItem.duration)
            }
        })
        self.width = 0
    }

    func play() {
        if self.player.currentItem == nil { return }
        self.player.play()
        if self.player.currentItem?.status == .readyToPlay {
            self.playing = true
        }
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self]_ in
            if self.player.currentItem?.status == .readyToPlay {
                self.playing = true
                let value = CMTimeGetSeconds(self.player.currentTime()) / CMTimeGetSeconds(self.player.currentItem!.duration)
                self.width = self.screen * CGFloat(value)
                self.playerCurrentTimeString = self.CMTimeToTimeString(cmTime: (self.player.currentTime()))
                
                nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = self.player.currentItem!.currentTime().seconds
                MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
            }
        }
    }

    func pause() {
        self.player.pause()
        self.playing = false
        self.timer?.invalidate()
    }
    
    func setCurrentAudio(currentAudioList: [Audio], currentAudioIndex: Int) {
        self.currentAudioList = currentAudioList
        self.totalAudioList = currentAudioList
        self.totalAudioIndex = currentAudioIndex
        self.isShowPlayer = true
        setCurrentAudioFromAudio(currentAudio: currentAudioList[currentAudioIndex])
        // TODO: 履歴一覧と自動再生一覧を取得してtotalAudioListに入れる
    }
    
    func setCurrentAudioFromAudio(currentAudio: Audio) {
        self.pause()
        self.currentAudio = currentAudio
        replasePlayer(url: URL(string: currentAudio.url!)!)
        setupNowPlaying(audio: currentAudio)
        self.play()
    }
    
    func showPlayer() {
        if self.player.currentItem != nil {
            self.isShowPlayer = true
        }
    }

    func onPrev() {
        if (self.playerItem == nil) { return }
        // 3秒以内の場合
        if CMTimeGetSeconds(self.player.currentTime()) <= 3 {
            // 前の曲
            if self.totalAudioIndex == 0 { return } // 前の曲がない場合、処理を止める
            self.totalAudioIndex = self.totalAudioIndex - 1
            setCurrentAudioFromAudio(currentAudio: self.totalAudioList[self.totalAudioIndex])
        } else {
            // 再生中の音楽の時間を0にする
            self.player.seek(to: CMTime.zero)
        }
    }

    func onNext() {
        if (self.playerItem == nil || self.totalAudioIndex == (self.totalAudioList.count - 1)) { return } // 次の曲がない場合は、処理を止める
        self.totalAudioIndex = self.totalAudioIndex + 1
        setCurrentAudioFromAudio(currentAudio: self.totalAudioList[self.totalAudioIndex])
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

    // 音楽が終了した時
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        onNext()
    }
    
    func changeCurrentPlayerViewType(type: PlayerViewType) {
        // 同じtypeに変更しようとした場合、mainに戻る
        if (self.currentPlayerViewType == type) {
            self.currentPlayerViewType = .main
            return
        }
        self.currentPlayerViewType = type
    }
    
    func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()

        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            if self.player.rate == 0.0 {
                self.player.play()
                return .success
            }
            return .commandFailed
        }

        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.player.rate == 1.0 {
                self.player.pause()
                return .success
            }
            return .commandFailed
        }
        
        // Add handler for Next Command
        commandCenter.nextTrackCommand.addTarget { [unowned self] event in
            onNext()
            return .success
        }
        
        // Add handler for Prev Command
        commandCenter.previousTrackCommand.addTarget { [unowned self] event in
            onPrev()
            return .success
        }
    }
    
    func setupNowPlaying(audio: Audio) {
        // Define Now Playing Info
        nowPlayingInfo[MPMediaItemPropertyTitle] = audio.name
        let image = DownLoadUIImageByUrl(url: URL(string: audio.posterUrl!)!)
        
        nowPlayingInfo[MPMediaItemPropertyArtwork] =
            MPMediaItemArtwork(boundsSize: image.size) { size in
                return image
        }
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = self.player.currentItem!.currentTime().seconds
        nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = self.player.currentItem!.asset.duration.seconds
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = self.player.rate

        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
}
