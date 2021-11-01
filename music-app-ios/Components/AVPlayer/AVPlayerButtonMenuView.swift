//
//  AVPlayerButtonMenuView.swift
//  music-app-ios
//
//  Created by Apple on 2021/11/01.
//

import SwiftUI

struct AVPlayerButtonMenuView: View {
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "quote.bubble")
            Spacer()
            Button(action: { self.audioPlayerViewModel.isShowList.toggle() }) {
                Image(systemName: "list.dash")
            }.accentColor(Color("Text"))
            Spacer()
        }
    }
}

struct AVPlayerButtonMenuView_Previews: PreviewProvider {
    static var previews: some View {
        AVPlayerButtonMenuView()
    }
}
