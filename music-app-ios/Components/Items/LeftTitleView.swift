//
//  LeftTitleView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct LeftTitleView: View {
    let title: String
    
    init (title: String = "Title") {
        self.title = title
    }
    var body: some View {
        HStack {
            Spacer().frame(width: 20)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}

struct LeftTitleView_Previews: PreviewProvider {
    static var previews: some View {
        LeftTitleView()
    }
}
