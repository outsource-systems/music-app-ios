//
//  ItemView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct ItemView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ItemSampleView()
            Text("Sample")
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
