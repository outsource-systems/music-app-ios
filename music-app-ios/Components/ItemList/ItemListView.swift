//
//  ItemListView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct ItemListView: View {
    let headerTitle: String = "Top Songs"
    let rightLinkText: String = "See All"
    let itemWidth: CGFloat = 390
    var body: some View {
        VStack {
            ListHeader(headerTitle: headerTitle, rightLinkText: rightLinkText)
            ScrollView(.horizontal) {
                HStack {
                    VStack(spacing: 0) {
                        ForEach(1..<6) {_ in
                            ItemHorizontalView().frame(width: itemWidth)
                        }
                    }
                    VStack(spacing: 0) {
                        ForEach(1..<6) {_ in
                            ItemHorizontalView().frame(width: itemWidth)
                        }
                    }
                }
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView().environment(\.colorScheme, .dark).background(Color(.black))
        ItemListView()
    }
}
