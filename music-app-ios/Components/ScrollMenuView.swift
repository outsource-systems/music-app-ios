//
//  ScrollMenuView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct ScrollMenuView: View {
    let menuItems = ["ALL", "Popular", "Hiphop", "Radio", "Classical"]
    let activeMenuItem = "ALL"
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(menuItems, id: \.hashValue) { menuItem in
                            if menuItem == activeMenuItem {
                                HStack {
                                    Text(menuItem)
                                }
                                .frame(minWidth: 40)
                                .padding(12)
                                .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundColor(Color.primary), alignment: .center)
                                .font(Font.system(.footnote, design: .default).weight(.medium))
                                .foregroundColor(Color(.systemBackground))
                            } else {
                                HStack {
                                    Text(menuItem)
                                }
                                .frame(minWidth: 40)
                                .padding(12)
                                .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundColor(Color(.systemFill)), alignment: .center)
                                .font(Font.system(.footnote, design: .default).weight(.medium))
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct ScrollMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollMenuView().environment(\.colorScheme, .dark)
        ScrollMenuView()
    }
}
