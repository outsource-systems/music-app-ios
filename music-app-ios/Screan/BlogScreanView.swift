//
//  BlogScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct BlogScreanView: View {
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            ScrollView {
                Spacer().frame(height: 110)
                GeometryReader { geometry in
                    VStack {
                        ForEach(1..<10) { index in
                            HStack {
                                ForEach(1..<4) { index in
                                    Image("SampleAudioImage")
                                        .resizable()
                                        .frame(width: geometry.size.width / 3.1, height: geometry.size.width / 3.1)
                                        .padding(0)
                                    Spacer().frame(width: 5)
                                }
                            }
                            Spacer().frame(height: 5)
                        }
                    }
                }
            }.overlay(
                ZStack {
                    VStack {
                        SearchBarView()
                        ScrollMenuView()
                        Spacer()
                    }
                }
            )
        }
    }
}

struct BlogScreanView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BlogScreanView().environment(\.colorScheme, .dark)
            BlogScreanView()
        }
    }
}
