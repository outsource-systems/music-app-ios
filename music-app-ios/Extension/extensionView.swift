//
//  extensionView.swift
//  music-app-ios
//
//  Created by Apple on 2021/10/30.
//

import Foundation
import SwiftUI

extension View {
    func debugAction(_ closure: () -> Void) -> Self {
        #if DEBUG
        closure()
        #endif

        return self
    }
}
