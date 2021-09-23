//
//  SliderView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct SliderView: View {
    @State private var sliderVal : Double = 0
    var body: some View {
        VStack() {
            Slider(value: $sliderVal, in: 0...100)
                .padding(.horizontal)
                .accentColor(Color("Text"))
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView().background(Color.black).environment(\.colorScheme, .dark)
        SliderView()
    }
}
