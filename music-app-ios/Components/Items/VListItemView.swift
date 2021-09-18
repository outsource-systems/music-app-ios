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
            VStack {
                HStack {
                    ItemView()
                    ItemView()
                }.frame(maxWidth: .infinity)
                HStack {
                    ItemView()
                    ItemView()
                }
                HStack {
                    ItemView()
                    ItemView()
                }
                HStack {
                    ItemView()
                    ItemView()
                }
                HStack {
                    ItemView()
                    ItemView()
                }
            }
            .padding(.horizontal)
        }
    }
}

struct VListItemView_Previews: PreviewProvider {
    static var previews: some View {
        VListItemView()
    }
}
