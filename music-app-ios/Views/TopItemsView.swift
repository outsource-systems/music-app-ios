//
//  TopItemsView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct TopItemsView: View {
    let items: [Audio]

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TopItemsView_Previews: PreviewProvider {
    static var previews: some View {
        let topItemViewModel: TopItemViewModel = TopItemViewModel()
        TopItemsView(items: topItemViewModel.audioList.audios)
    }
}
