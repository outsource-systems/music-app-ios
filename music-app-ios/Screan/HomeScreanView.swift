//
//  HomeScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct HomeScreanView: View {
    var body: some View {
        let bounds = UIScreen.main.bounds
        let width = bounds.width
        NavigationView {
            ZStack {
                Color("Background").edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    ZStack {
                        VStack {
                            Image("HomeCover")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: width, height: width)
                            Spacer()
                        }
                    }.overlay(
                        VStack {
                            VStack {
                                Text("microM")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .frame(alignment: .top)
                                Spacer().frame(height: 100)
                            }.frame(maxWidth: .infinity)
                             .background(
                                LinearGradient(gradient: Gradient(colors: [Color("Background"), Color("Gradient")]), startPoint: .top, endPoint: .bottom)
                             )
                            Spacer().frame(height: 150)
                            VStack {
                                Spacer().frame(height: 120)
                            }.frame(maxWidth: .infinity)
                            .background(
                               LinearGradient(gradient: Gradient(colors: [Color("Gradient"), Color("Background")]), startPoint: .top, endPoint: .bottom)
                            ).overlay(
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        PlayIconView()
                                        Spacer().frame(width: 20)
                                    }
                                    Spacer().frame(height: 20)
                                }
                            )
                        },
                        alignment: .top
                    )
                    HomeAudioListView()
                }
            }.navigationBarHidden(true)
        }.accentColor(Color("ButtonLabel"))
    }
}

struct HomeScreanView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeScreanView().environment(\.colorScheme, .dark)
            HomeScreanView()
        }
    }
}
