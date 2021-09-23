//
//  ModalView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct ModalView: View {
        var body: some View {
            VStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .frame(width: 32, height: 4.5)
                    .clipped()
                    .padding(.vertical, 10)
                    .foregroundColor(Color(.tertiaryLabel))
                    .frame(maxWidth: .infinity)
                    .clipped()
            }
            .background(Image("myImage")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill), alignment: .center)
        }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
