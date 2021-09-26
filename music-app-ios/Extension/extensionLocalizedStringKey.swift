//
//  extensionLocalizedStringKey.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import Foundation
import SwiftUI

extension LocalizedStringKey {
    var stringKey: String {
        let description = "\(self)"
        let components = description.components(separatedBy: "key: \"")
            .map { $0.components(separatedBy: "\",") }
        return components[1][0]
    }
}
