//
//  LeftImageItemView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct LeftImageItemView: View {
    let size: CGFloat
    let title: String
    let count: Int
    let date: String
    let imageUrl: String?

    init (size: CGFloat = 100, title: String = "No Title", count: Int = 1, date: String = "SEP 8, 2021", imageUrl: String? = nil) {
        self.size = size
        self.title = title
        self.count = count
        self.date = date
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        HStack {
            Spacer().frame(width: 20)
            ImageCornerRadiusView(size: size, imageUrl: imageUrl)
            Spacer().frame(width: 20)
            VStack {
                Spacer().frame(height: 5)
                Text(date)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(count) song")
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    AddIconView(size: 20)
                    Spacer()
                }
                Spacer().frame(height: 10)
            }.frame(maxWidth: .infinity, maxHeight: 90)
        }.frame(maxWidth: .infinity)
        .background(Color("Background"))
    }
}

struct LeftImageItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LeftImageItemView().environment(\.colorScheme, .dark)
            LeftImageItemView()
        }
    }
}
