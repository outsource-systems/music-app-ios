//
//  VolumeSliderView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct VolumeSliderView: View {
    @Binding var volume: Double
    var body: some View {
        VStack {
                HStack {
                    Image(systemName: "speaker.fill")
                    Slider(value: self.$volume, in: 0...1)
                        .padding(.horizontal)
                        .accentColor(Color("Text"))
                    Image(systemName: "speaker.wave.2.fill")
                }
        }
    }
}

struct VolumeSliderView_Previews: PreviewProvider {
    @State static var volume = 0.0
    static var previews: some View {
        VolumeSliderView(volume: $volume).background(Color.black).environment(\.colorScheme, .dark)
        VolumeSliderView(volume: $volume)
    }
}
