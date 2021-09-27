//
//  ItemHorizonAutoScrollView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/27.
//

import SwiftUI

struct ItemHorizonAutoScrollView: View {
    let size: CGFloat = 100

    var body: some View {
            HStack {
                VStack {
                    ForEach((0...3), id: \.self) { row in
                        HStack {
                            if (row % 2 == 0) {
                                Spacer().frame(width: 70)
                            }
                            ForEach((0...6), id: \.self) { row in
                                ItemSampleView(size: size)
                            }
                        }
                    }
                }
            }.padding(.vertical).background(gradientBackGroundColor())
    }
}

struct ItemHorizonAutoScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ItemHorizonAutoScrollView()
    }
}
