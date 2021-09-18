//
//  AlbumView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct AlbumView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: true) {
                    AlbumHeaderView()
                    AlbumCoverView()
                    PlayAndShuffleButtonView()
                    AudioTitleItemsView()
            }
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView().environment(\.colorScheme, .dark)
        AlbumView()
    }
}

