//
//  AudioPlaySample.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct AudioPlaySample: View {
    @State private var isShown: Bool = false
    var body: some View {
        Button(action: { self.isShown = true }) {
            Text("Open")
        }
        .sheet(isPresented: self.$isShown) {
            VStack {
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .frame(width: 32, height: 4.5)
                    .clipped()
                    .padding(.vertical, 10)
                    .foregroundColor(Color(.tertiaryLabel))
                    .frame(maxWidth: .infinity)
                    .clipped()
                Spacer()
            }
        }
    }
}

struct AudioPlaySample_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlaySample()
    }
}
