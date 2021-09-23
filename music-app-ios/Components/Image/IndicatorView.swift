//
//  IndicatorView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct IndicatorView: UIViewRepresentable {
    let isAnimating: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicatorView = UIActivityIndicatorView(style: .medium)
        indicatorView.hidesWhenStopped = true
        
        return indicatorView
    }
    
    func updateUIView(_ indicatorView: UIActivityIndicatorView, context: Context) {
        isAnimating ? indicatorView.startAnimating() : indicatorView.stopAnimating()
    }
}
