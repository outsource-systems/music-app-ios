//
//  LeftTitleView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct LeftTitleView: View {
    let title: String
    let rightLinkText: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.leading)
            Spacer()
            TextButtonView(labelText: rightLinkText).padding(.trailing)
        }
    }
}

struct LeftTitleView_Previews: PreviewProvider {
    static var previews: some View {
        LeftTitleView(title: "Title", rightLinkText: "See All")
    }
}
