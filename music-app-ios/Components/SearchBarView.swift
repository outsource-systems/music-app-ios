//
//  SearchBarView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct SearchBarView: View {
    @State var searchText: String = ""
    var body: some View {
        TextField("Search", text: $searchText).frame(height: 40).background(RoundedRectangle(cornerRadius: 13, style: .continuous)
                                                            .foregroundColor(Color(.tertiarySystemFill)), alignment: .center)
            .padding(.horizontal, 24).multilineTextAlignment(TextAlignment.center)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
