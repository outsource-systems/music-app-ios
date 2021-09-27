//
//  LinearGradientModule.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/27.
//

import Foundation
import SwiftUI

func gradientBackGroundColor(colorOne: Color = Color("ButtonBackground"), colorTwo: Color = Color("Text")) -> LinearGradient {
    // 左上から右下にポイントを設定する。
    let start = UnitPoint.init(x: 0, y: 0) // 左上(始点)
    let end = UnitPoint.init(x: 1, y: 1) // 右下(終点)

    // 「Color」は以前の「UIColor」からの変換もできるぞ！ 助かる。
    let colors = Gradient(colors: [colorOne, colorTwo])

    let gradientColor = LinearGradient(gradient: colors, startPoint: start, endPoint: end)

    return gradientColor
}
