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
        HStack {
            Image(systemName: "magnifyingglass")
            Text("Search")
        }
        .padding(.vertical, 12)
        .font(.system(size: 18, weight: .regular, design: .default))
        .foregroundColor(Color.secondary)
        .frame(maxWidth: .infinity)
        .clipped()
        .background(RoundedRectangle(cornerRadius: 13, style: .continuous)
            .foregroundColor(Color(.tertiarySystemFill)), alignment: .center)
        .padding(.horizontal, 24)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
