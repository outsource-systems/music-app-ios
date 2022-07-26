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
    let rightLinkDestination: AnyView
    var onClickRightButton: (() -> Void)!
    
    var body: some View {
        HStack {
            Text(LocalizedStringKey(headerTitle))
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.leading)
            Spacer()
            TextButtonView(labelText: rightLinkText, destination: rightLinkDestination, onClickButton: onClickRightButton).padding(.trailing)
        }
    }
}

struct ListHeader_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListHeader(headerTitle: "Title", rightLinkText: "See All", rightLinkDestination: AnyView(Text("text")))
            ListHeader(headerTitle: "Title", rightLinkText: "See All", rightLinkDestination: AnyView(Text("text"))).environment(\.locale, .init(identifier: "ja"))
        }
    }
}
