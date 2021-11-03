//
//  HomeScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct HomeScreanView: View {
    @State private var headerHidden = false
    
    var body: some View {
        let bounds = UIScreen.main.bounds
        let width = bounds.width
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Image("HomeCover")
                            .resizable()
                            .frame(width: width, height: width)
                            .overlay(
                                VStack {
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            
                                        }) {
                                            PlayIconView(size: CGFloat(width * 0.13))
                                        }.padding(.trailing).padding(.top, width * 1.01)
                                    }
                                }
                            )
                    }.overlay(
                        VStack {
                            Spacer().frame(width: width, height: width * 0.5).background(Color("Background"))
                            LinearGradient(gradient: Gradient(colors: [Color("Background"), Color("Gradient")]), startPoint: .top, endPoint: .bottom).frame(height: width * 0.3)
                                .overlay(
                                  Text("microM")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .frame(alignment: .top)
                                    .padding(.bottom, width * 0.2)
                            )
                            Spacer()
                        }.padding(.top, -(width * 0.5))
                    ).padding(.bottom)
                    HomeAudioListView()
                }.navigationBarHidden(true)
                 .background(Color("Background"))
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
