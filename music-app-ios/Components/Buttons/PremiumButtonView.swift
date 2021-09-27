//
//  PremiumButtonView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/28.
//

import SwiftUI

struct PremiumButtonView: View {
    @State private var show: Bool = false
    var body: some View {
        Button(action: { self.show = true }) {
            Text("プレミアム会員登録 👍")
                .fontWeight(.semibold)
                .frame(width: 340, height: 55)
                .foregroundColor(Color(.white))
                .background(gradientBackGroundColor(colorOne: Color("ButtonLabel"), colorTwo: Color("ButtonLabel1")))
                .cornerRadius(24)
        }.padding(.vertical, 40).sheet(isPresented: self.$show) {
            PremiumRegistorView()
        }
    }
}

struct PremiumButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumButtonView()
    }
}
