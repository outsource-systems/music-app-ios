//
//  ItemListVerticalView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct ItemListVerticalView: View {
    let itemWidth: CGFloat = 390
    var body: some View {
        ScrollView {
            ForEach(1..<40) {_ in
                ItemHorizontalView().frame(width: itemWidth)
            }
        }
    }
}

struct ItemListVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListVerticalView()
    }
}
