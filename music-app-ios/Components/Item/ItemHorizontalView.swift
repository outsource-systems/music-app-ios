//
//  ItemHorizontalView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct ItemHorizontalView: View {
    var size: CGFloat = 50
    var productTitle: String = "Album Name"
    var relaseDate: String = "2020"
    var title: String = "Title"
    var imageUrl: String? = "https://firebasestorage.googleapis.com/v0/b/image-89fb3.appspot.com/o/Jungle%20%E3%82%B7%E3%82%99%E3%83%A3%E3%82%B1.jpg?alt=media&token=05bbd0da-749b-4912-a613-5f489ca568f5"
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Spacer().frame(width: size).padding(.horizontal, 5)
                VStack {
                    Divider()
                }
                Spacer().frame(width: 10)
            }.padding(0)
            HStack {
                ImageCornerRadiusView(size: size, imageUrl: imageUrl)
                VStack {
                    HStack {
                        Text(title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    HStack {
                        Text("\(productTitle)・\(relaseDate)")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("SubText"))
                        Spacer()
                    }
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "ellipsis").padding(.trailing).accentColor(Color("Text"))
                }
            }.padding(.vertical, 3).padding(.leading, 5)
        }
    }
}

struct ItemHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        ItemHorizontalView().background(Color("Background")).environment(\.colorScheme, .dark)
        ItemHorizontalView()
    }
}
