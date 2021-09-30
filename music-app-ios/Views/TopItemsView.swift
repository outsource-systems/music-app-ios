//
//  TopItemsView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct TopItemsView: View {
    let headerTitle: String = "Top Songs"
    let rightLinkText: String = "See All"
    let topItemViewModel: TopItemViewModel = TopItemViewModel()

    var body: some View {
        ItemListView(headerTitle: headerTitle,
                     rightLinkText: rightLinkText,
                     audios: topItemViewModel.audioList.audios, rightLinkDestination: AnyView(ItemListVerticalView(audios: topItemViewModel.audioList.audios).navigationBarTitle(headerTitle, displayMode: .inline)))
    }
}

struct TopItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TopItemsView().environment(\.locale, .init(identifier: "ja"))
    }
}
