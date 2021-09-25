//
//  ProductHeaderView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/25.
//

import SwiftUI

struct ProductHeaderView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 6) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 21, weight: .medium, design: .default))
                Text("Home")
                Spacer()
                HStack(spacing: 2) {
                    Image(systemName: "plus")
                        .font(.system(size: 13, weight: .bold, design: .default))
                    Text("Add")
                }
                .padding(.vertical, 4)
                .padding(.leading, 7)
                .padding(.trailing, 14)
                .background(RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .foregroundColor(Color("Background"))
                    .frame(height: 27)
                    .clipped(), alignment: .center)
                .font(.system(size: 15, weight: .semibold, design: .default))
                .padding(.trailing, 15)
                Image(systemName: "ellipsis")
                    .padding(.vertical, 11)
                    .padding(.horizontal, 5)
                    .background(Circle()
                        .frame(height: 27)
                        .clipped()
                        .foregroundColor(Color("Background")), alignment: .center)
                    .font(.system(size: 16, weight: .semibold, design: .default))
            }
            .padding(.horizontal, 7)
            .padding(.trailing, 9)
            .foregroundColor(Color.pink)
        }
    }
}

struct ProductHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProductHeaderView()
    }
}
