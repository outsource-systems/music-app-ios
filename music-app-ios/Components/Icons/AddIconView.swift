//
//  AddIconView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct AddIconView: View {
    let size: CGFloat
    
    init(size: CGFloat = 50) {
        self.size = size
    }
    
    var body: some View {
        Circle()
            .fill(Color("ButtonLabel"))
          .frame(width: size, height: size).overlay(
            Image(systemName: "plus.circle.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color("ButtonBackground"))
                .frame(width: size, height: size)
        )
    }
}

struct AddIconView_Previews: PreviewProvider {
    static var previews: some View {
        AddIconView()
    }
}
