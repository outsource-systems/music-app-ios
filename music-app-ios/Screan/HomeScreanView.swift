//
//  HomeScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct HomeScreanView: View {
    var productListViewModel: ProductListViewModel
    var recommendProductViewModel: RecommendProductViewModel
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    ZStack {
                        VStack {
                            Image("HomeCover")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Spacer()
                        }
                    }.overlay(
                        VStack {
                            VStack {
                                Text("MicroM")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .frame(alignment: .top)
                                Spacer().frame(height: 100)
                            }.frame(maxWidth: .infinity)
                             .background(
                                LinearGradient(gradient: Gradient(colors: [Color("Background"), Color("Gradient")]), startPoint: .top, endPoint: .bottom)
                             )
                            Spacer().frame(height: 200)
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
                    HomeAudioListView(productListViewModel: productListViewModel, recommendProductViewModel: recommendProductViewModel)
                }
            }.navigationBarHidden(true)
        }.accentColor(Color("ButtonLabel"))
    }
}

struct HomeScreanView_Previews: PreviewProvider {
    static var previews: some View {
        let productListViewModel: ProductListViewModel = ProductListViewModel()
        let recommendProductViewModel: RecommendProductViewModel = RecommendProductViewModel()
        Group {
            HomeScreanView(productListViewModel: productListViewModel, recommendProductViewModel: recommendProductViewModel).environment(\.colorScheme, .dark)
            HomeScreanView(productListViewModel: productListViewModel, recommendProductViewModel: recommendProductViewModel)
        }
    }
}
