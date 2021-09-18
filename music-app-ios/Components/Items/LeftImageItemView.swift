//
//  LeftImageItemView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct LeftImageItemView: View {
    var body: some View {
        HStack {
            Spacer().frame(width: 20)
            ItemSampleView(size: 100)
            Spacer().frame(width: 20)
            VStack {
                Spacer().frame(height: 5)
                Text("SEP 8, 2021")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Audio Title")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("1 song")
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
