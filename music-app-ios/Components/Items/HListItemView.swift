//
//  HListItemView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct HListItemView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ItemView()
                ItemView()
                ItemView()
                ItemView()
                ItemView()
            }
            .padding(.horizontal)
        }
    }
}

struct HListItemView_Previews: PreviewProvider {
    static var previews: some View {
        HListItemView()
    }
}
