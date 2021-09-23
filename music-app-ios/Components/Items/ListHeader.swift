//
//  ListHeader.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct ListHeader: View {
    let headerTitle: String
    let rightLinkText: String
    var body: some View {
        LeftTitleView(title: headerTitle)
            .overlay(
                HStack {
                    Spacer()
                    TextButtonView(labelText: rightLinkText)
                }
            )
    }
}

struct ListHeader_Previews: PreviewProvider {
    static var previews: some View {
        ListHeader(headerTitle: "Title", rightLinkText: "See All")
    }
}
