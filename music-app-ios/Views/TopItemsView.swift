//
//  TopItemsView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct TopItemsView: View {
    @ObservedObject var topItemViewModel: TopItemViewModel = TopItemViewModel()

    func onClickRightButton() {
    }
    
    var body: some View {
        ItemListView(headerTitle: self.topItemViewModel.headerTitle,
                     rightLinkText: self.topItemViewModel.rightLinkText,
                     audios: topItemViewModel.items,
                     rightLinkDestination: AnyView(ItemListVerticalView(audios: topItemViewModel.items).navigationBarTitle(self.topItemViewModel.headerTitle, displayMode: .inline)),
                     onClickRightButton: onClickRightButton
        )
    }
}

struct TopItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TopItemsView().environment(\.locale, .init(identifier: "ja"))
    }
}
