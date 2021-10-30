//
//  AudioPlayStatusView.swift
//  music-app-ios
//
//  Created by Apple on 2021/09/18.
//

import SwiftUI

struct AudioPlayStatusView: View {
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    @State private var showingSheet = false
    
    var body: some View {
        Button(action: {
            self.showingSheet = true
                }){
            HStack(spacing: 0) {
                Image("SampleAudioImage")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                    .clipped()
                    .mask(RoundedRectangle(cornerRadius: 4, style: .continuous))
                    .shadow(color: Color(.displayP3, red: 0/255, green: 0/255, blue: 0/255).opacity(0.22), radius: 4, x: 0, y: 4)
                    .padding(.trailing)
                Text("俺らのCLASSIC")
                Spacer()
                HStack(spacing: 24) {
                    Image(systemName: "play.fill")
                        .font(.system(size: 21, weight: .regular, design: .default))
                    Image(systemName: "forward.fill")
                        .font(.system(size: 21, weight: .regular, design: .default))
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 7)
            .background(Color("Background")).opacity(0.9)
        }.foregroundColor(Color("Text"))
        .sheet(isPresented: $showingSheet) {
            AudioPlayScreanView().environmentObject(audioPlayerViewModel)
         }
    }
}

struct AudioPlayStatusView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AudioPlayStatusView().environment(\.colorScheme, .dark).environmentObject(AudioPlayerViewModel())
            AudioPlayStatusView().environmentObject(AudioPlayerViewModel())
        }
        .previewLayout(.fixed(width: 350, height: 70))
    }
}
