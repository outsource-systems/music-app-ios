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
            Text("BlogScreanView")
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
