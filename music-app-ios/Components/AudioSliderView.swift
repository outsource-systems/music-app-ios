//
//  AudioSliderView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct AudioSliderView: View {
    @State private var sliderVal : Double = 0
    var body: some View {
            HStack {
                Image(systemName: "speaker.fill")
                Slider(value: $sliderVal, in: 0...100)
                    .padding(.horizontal)
                    .accentColor(Color("Text"))
                Image(systemName: "speaker.wave.2.fill")
            }
    }
}

struct AudioSliderView_Previews: PreviewProvider {
    static var previews: some View {
        AudioSliderView().background(Color.black).environment(\.colorScheme, .dark)
        AudioSliderView()
    }
}
