//
//  VolumeSlider.swift
//  music-app-ios
//
//  Created by Apple on 2021/10/25.
//

import SwiftUI
import MediaPlayer
import UIKit

struct VolumeSlider: UIViewRepresentable {
    typealias UIViewType = VolumeSliderView
         
    @State var volume: Float = 0.5
         
        let view: VolumeSliderView = VolumeSliderView()
         
        func makeUIView(context: Context) -> VolumeSliderView {
            view.setVolumeThumbImage(UIImage(named: "volume"), for: .normal)
     
            if let uislider = getUISlider() {
                volume = uislider.value
                uislider.addTarget(context.coordinator,
                                   action: #selector(Coordinator.updateVolume(sender:)),
                                   for: .valueChanged)
            }
            return view
        }
        
        func updateUIView(_ uiView: VolumeSliderView, context: Context) {
        }
         
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
         
        func getVolume() -> Float {
            var volume: Float = 0.0
            if let uislider = getUISlider() {
                print(uislider.value)
                volume = uislider.value
            }
            return volume
        }
         
        func getUISlider() -> UISlider? {
            var uislider: UISlider? = nil
            for subview in view.subviews {
                if let slider = subview as? UISlider {
                    uislider = slider
                }
            }
            return uislider
        }
         
        class Coordinator {
            var parent: VolumeSlider
             
            init(_ parent: VolumeSlider) {
                self.parent = parent
            }
             
            @objc func updateVolume(sender: UISlider) {
                print(#function)
                parent.volume = sender.value
                print(parent.volume)
            }
        }
}

