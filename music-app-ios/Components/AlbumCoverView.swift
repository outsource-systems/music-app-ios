//
//  AlbumCoverView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct AlbumCoverView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                Image("AlbumSample")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 232, height: 232)
                    .clipped()
                    .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .padding(.top)
                    .shadow(color: Color("Text").opacity(0.13), radius: 8, x: 0, y: 14)
                VStack(spacing: 1) {
                    Text("Shawn Mendes (Deluxe)")
                        .font(.system(size: 20, weight: .medium, design: .default))
                    Text("Shawn Mendes")
                        .font(.system(size: 20, weight: .regular, design: .default))
                        .foregroundColor(Color.pink)
                    Text("POP • 2018")
                        .font(.system(size: 11, weight: .medium, design: .default))
                        .offset(x: 0, y: 4)
                        .foregroundColor(Color.secondary)
                }
                .padding(.top, 17)
            }
        }
    }
}

struct AlbumCoverView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCoverView().environment(\.colorScheme, .dark)
        AlbumCoverView()
    }
}
