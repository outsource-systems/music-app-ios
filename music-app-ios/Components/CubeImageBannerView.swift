//
//  CubeImageBannerView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/19.
//

import SwiftUI

struct CubeImageBannerView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image("SampleAudioImage")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            VStack(alignment: .leading, spacing: 3) {
                Spacer()
                Text("NOW PLAYING")
                    .font(Font.system(.caption2, design: .default).weight(.semibold))
                    .opacity(0.5)
                Text("Need to Know")
                    .font(Font.system(.subheadline, design: .default).weight(.semibold))
                Text("Doja Cat")
                    .font(Font.system(.subheadline, design: .default).weight(.medium))
                    .opacity(0.9)
            }
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .clipped()
            .padding(.bottom, 4)
            Image(systemName: "infinity")
                .foregroundColor(Color.white)
                .font(Font.system(.callout, design: .default).weight(.medium))
        }
        .frame(maxWidth: .infinity)
        .clipped()
        .padding()
        .background(Image("SampleAudioImage")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .scaleEffect(1.3, anchor: .center)
            .blur(radius: 36)
            .overlay(
                VisualEffectView(style: .systemUltraThinMaterial)
                .opacity(0.25), alignment: .center
            ), alignment: .center)
    }
}

struct CubeImageBannerView_Previews: PreviewProvider {
    static var previews: some View {
        CubeImageBannerView()
    }
}
