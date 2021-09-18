//
//  LibraryScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct LibraryScreanView: View {
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            Text("LibraryScreanView")
        }
    }
}

struct LibraryScreanView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LibraryScreanView().environment(\.colorScheme, .dark)
            LibraryScreanView()
        }
    }
}
