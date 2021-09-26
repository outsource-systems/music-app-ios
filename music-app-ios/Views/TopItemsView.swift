//
//  TopItemsView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct TopItemsView: View {
    let topItemViewModel: TopItemViewModel = TopItemViewModel()
    // let items: [Audio] = topItemViewModel.audioList.audios

    var body: some View {
        ItemListView()
    }
}

struct TopItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TopItemsView()
    }
}
