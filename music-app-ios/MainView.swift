//
//  MainView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabBarView()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.colorScheme, .dark)
        MainView()
    }
}
