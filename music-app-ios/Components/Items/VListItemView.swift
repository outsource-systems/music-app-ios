//
//  VListItemView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct VListItemView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                ForEach((1...20), id: \.self) { index in
                    ItemView()
                }
            }
        }
    }
}

struct VListItemView_Previews: PreviewProvider {
    static var previews: some View {
        VListItemView()
    }
}
