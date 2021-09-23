//
//  TextButtonView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct TextButtonView: View {
    let labelText: String
    var body: some View {
        Button(action: {}) {
            Text(labelText)
                .foregroundColor(Color("ButtonLabel"))
        }
        .padding(.all)
    }
}

struct TextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonView(labelText: "Button")
    }
}
