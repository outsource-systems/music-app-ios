//
//  TextButtonView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct TextButtonView: View {
    @State var isLinkActive = false
    let labelText: String
    let destination: AnyView
    var onClickButton: (() -> Void)!
    
    var body: some View {
        NavigationLink(destination: destination, isActive: $isLinkActive) {
            Button(action: {
                self.isLinkActive = true
                if (onClickButton != nil) { onClickButton() }
            }) {
                Text(LocalizedStringKey(labelText)).foregroundColor(Color("ButtonLabel"))
            }.padding(.all)
        }
    }
}

struct TextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonView(labelText: "Button", destination: AnyView(Text("test")))
    }
}
