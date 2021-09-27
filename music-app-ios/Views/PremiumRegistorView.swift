//
//  PremiumRegistorView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/27.
//

import SwiftUI

struct PremiumRegistorView: View {
    var body: some View {
        VStack {
            ItemHorizonAutoScrollView().padding(.vertical, -120)
            Spacer().frame(height: 120)
            HStack {
                Text("MicroM")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .padding(.top)
                Spacer()
            }
            HStack {
                Text("アプリをご利用いただきありがとうございます😄")
                    .foregroundColor(Color("SubText"))
                Spacer()
            }.padding()
            HStack {
                Text("プレミアム会員特典")
                    .font(.title3)
                    .fontWeight(.medium)
                Spacer()
            }.padding(.leading).padding(.bottom)
            HStack {
                Image(systemName: "checkmark.seal.fill").foregroundColor(Color.green)
                Text("限定配信コンテンツの視聴")
                Spacer()
            }.padding(.leading).padding(.bottom)
            HStack {
                Image(systemName: "checkmark.seal.fill").foregroundColor(Color.green)
                Text("限定配信ブログ記事の閲覧")
                Spacer()
            }.padding(.leading)
            HStack {
                Text("月額980円のサブスクリプションは、\n7日間無料トライアル期間にキャンセルできます。")
                    .font(.subheadline)
                    .foregroundColor(Color("SubText"))
                Spacer()
            }.padding()
            Button(action: {}) {
                Text("無料トライアル & 登録(980円/月)")
                    .fontWeight(.semibold)
                    .frame(width: 340, height: 55)
                    .foregroundColor(Color(.white))
                    .background(gradientBackGroundColor(colorOne: Color("ButtonLabel"), colorTwo: Color("ButtonLabel1")))
                    .cornerRadius(24)
            }.padding()
            Spacer()
        }
    }
}

struct PremiumRegistorView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumRegistorView().background(Color("Background")).environment(\.colorScheme, .dark)
        PremiumRegistorView()
    }
}
