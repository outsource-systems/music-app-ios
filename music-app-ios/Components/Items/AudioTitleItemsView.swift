//
//  AudioTitleItemsView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct AudioTitleItemsView: View {
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                AudioListItemView()
                AudioListItemView()
                AudioListItemView()
            }
            .padding(.top, 30)
        }
    }
}

struct AudioTitleItemsView_Previews: PreviewProvider {
    static var previews: some View {
        AudioTitleItemsView().environment(\.colorScheme, .dark)
        AudioTitleItemsView()
    }
}

