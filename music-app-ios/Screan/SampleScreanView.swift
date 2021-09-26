//
//  SampleScreanView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/26.
//

import SwiftUI

struct SampleScreanView: View {
    var body: some View {
            NavigationView {
                List{
                    ForEach(0..<15) { item in
                        NavigationLink(
                            destination: Text("Destination")) {
                            HStack {
                              Text("Apple")
                                .font(.headline)
                                .fontWeight(.medium)
                            }
                        }
                    }
                }.navigationBarTitle("Hello", displayMode: .large)
            }
            
    }
}

struct SampleScreanView_Previews: PreviewProvider {
    static var previews: some View {
        SampleScreanView()
    }
}
