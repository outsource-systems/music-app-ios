//
//  ItemHorizonAutoScrollView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/27.
//

import SwiftUI

struct ItemHorizonAutoScrollView: View {
    let size: CGFloat = 100
    let topItemViewModel: TopItemViewModel = TopItemViewModel()
    
    var body: some View {
        let reverseAudios = topItemViewModel.items.reversed()
        ZStack {
            Image("HomeCover")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .blur(radius: 60.0, opaque: false)
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading) {
                    ForEach((0...2), id: \.self) { row in
                        ScrollView(.horizontal) {
                            HStack(alignment: .firstTextBaseline) {
                                if (row % 2 == 0) {
                                    ForEach(topItemViewModel.items, id: \.self) { audio in
                                        ImageView(size: size, imageUrl: audio.posterUrl)
                                    }
                                } else {
                                    ForEach(reverseAudios, id: \.self) { audio in
                                        ImageView(size: size, imageUrl: audio.posterUrl)
                                    }
                                    Spacer()
                                }
                            }
                        }.padding(.leading, CGFloat(-70 * row))
                    }
                }
                Spacer()
            }.padding(.vertical)
        }
    }
}

struct ItemHorizonAutoScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ItemHorizonAutoScrollView().environment(\.colorScheme, .dark)
        ItemHorizonAutoScrollView()
    }
}
