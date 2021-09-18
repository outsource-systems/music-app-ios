//
//  HomeAudioListView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct HomeAudioListView: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            LeftImageItemView()
            Spacer().frame(height: 20)
            Divider()
            Spacer().frame(height: 20)
            LeftTitleView()
            HListItemView()
            Divider()
            LeftTitleView()
            HListItemView()
        }.padding(.bottom, 200)
    }
}

struct HomeAudioListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeAudioListView()
    }
}
