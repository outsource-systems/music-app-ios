//
//  HListItemView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct HListItemView: View {
    var audios: [Audio]?
    var products: [Product]?
    let productViewModel: ProductViewModel = ProductViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                if (audios != nil) {
                    ForEach(audios ?? [], id: \.self) { audio in
                        ItemView(title: audio.title, size: 150, imageUrl: audio.posterUrl)
                    }
                } else if (products != nil) {
                    ForEach(products ?? [], id: \.self) { product in
                        NavigationLink(destination: ProductView().toolbar {
                            ToolbarItem(placement: .navigationBarTrailing){
                                                Button(action: {}) {
                                                    HStack {
                                                        Text("+ Add")
                                                    }
                                                }
                                            }
                            ToolbarItem(placement: .navigationBarTrailing){
                                                Button(action: {}) {
                                                    Image(systemName: "ellipsis")
                                                }
                                            }
                        }) {
                            ItemView(title: product.name, size: 150, imageUrl: product.posterUrl)
                                .navigationBarHidden(false)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct HListItemView_Previews: PreviewProvider {
    static var previews: some View {
        let audiosViewModel: AudiosViewModel = AudiosViewModel()
        HListItemView(audios: audiosViewModel.audios)
    }
}
