//
//  DownLoadUIImageByUrl.swift
//  music-app-ios
//
//  Created by Apple on 2021/11/03.
//

import Foundation
import Kingfisher
import SwiftUI

func DownLoadUIImageByUrl(url: URL?) -> UIImage {
    var uiImage: UIImage!
    if (url == nil) {
        uiImage = UIImage(named: "DefaultImage")
    } else {
        KingfisherManager.shared.retrieveImage(with: url!) { result in
            let image = try? result.get().image
            uiImage = image!
        }
    }

    return uiImage
}
