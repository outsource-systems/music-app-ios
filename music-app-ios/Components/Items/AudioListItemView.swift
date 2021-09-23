//
//  AudioListItemView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct AudioListItemView: View {
    let title: String
    let number: Int
    let isStar: Bool
    init (title: String = "No Title", number: Int = 1, isStar: Bool = false) {
        self.title = title
        self.number = number
        self.isStar = isStar
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 1)
                .clipped()
                .foregroundColor(Color(.systemGray6))
                .padding(.leading, 23)
            HStack(spacing: 0) {
                if isStar {
                    Image(systemName: "star.fill")
                        .font(.caption2)
                        .foregroundColor(Color.secondary)
                        .frame(width: 15, height: 15)
                } else {
                    Spacer().frame(width: 15, height: 15)
                }
                Text(String(number))
                    .frame(width: 16, alignment: .trailing)
                    .clipped()
                    .padding(.trailing, 15)
                    .foregroundColor(Color("Text"))
                VStack(alignment: .leading) {
                    Text(title)
                }
                Spacer()
                AddIconView(size: 30)
            }
            .padding(.horizontal, 5)
            .frame(height: 47)
            .clipped()
        }
    }
}

struct AudioListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AudioListItemView().environment(\.colorScheme, .dark).background(Color(.black))
        AudioListItemView()
    }
}
