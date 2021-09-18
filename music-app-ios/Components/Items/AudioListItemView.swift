//
//  AudioListItemView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct AudioListItemView: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 1)
                .clipped()
                .foregroundColor(Color(.systemGray6))
                .padding(.leading, 23)
            HStack(spacing: 0) {
                Image(systemName: "star.fill")
                    .font(.caption2)
                    .foregroundColor(Color.secondary)
                Text("1")
                    .frame(width: 16, alignment: .trailing)
                    .clipped()
                    .padding(.trailing, 15)
                    .foregroundColor(Color("Text"))
                VStack(alignment: .leading) {
                    Text("One Last Kiss")
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
        AudioListItemView().environment(\.colorScheme, .dark)
        AudioListItemView()
    }
}
