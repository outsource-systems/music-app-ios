//
//  SettingScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct SettingScreanView: View {
    var body: some View {
        NavigationView {
            VStack {
            }.navigationTitle("Setting")
        }
    }
}

struct SettingScreanView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingScreanView().environment(\.colorScheme, .dark)
            SettingScreanView()
        }
    }
}
