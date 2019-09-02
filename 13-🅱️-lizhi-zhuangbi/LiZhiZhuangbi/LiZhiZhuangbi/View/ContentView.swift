//
//  ContentView.swift
//  LiZhiZhuangbi
//
//  Created by Frad LEE on 8/29/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

let backgroundColor: Color = Color(red: 252/255, green: 247/255, blue: 247/255)
let defaultLyrics = Lyrics(id: 0, lyrics: "lyrics", title: "title", videoID: "videoID")

struct ContentView: View {
    
    @ObservedObject var lyricsLisViewModel = LyricsListViewModel()

    var body: some View {
        
        return ZStack {
            Rectangle()
                .foregroundColor(backgroundColor)
                .edgesIgnoringSafeArea(.all)
            ZStack {
//                List(lyricsLisViewModel.lyricsList.shuffled()) { lyrics in
//                    HStack {
//                        Text(lyrics.lyrics)
//                        Text(lyrics.title)
//                    }
//                }
                VStack {
                    LyricsCellView(lyrics: lyricsLisViewModel.lyricsList.shuffled().first ?? defaultLyrics)
                        .padding(.bottom, 400)
//                    Spacer()
                }
                VStack {
                    Spacer()
                    Button(action: {
                        self.lyricsLisViewModel.shuffle()
                    }) {
                        ZStack {
                            Circle()
                                .frame(width: 200, height: 200, alignment: .center)
                                .foregroundColor(Color.black).shadow(radius: 32)
                            Group{
                                Text("Zhuang").font(.system(size: 56, weight: .regular, design: .serif)).offset(y: -19).opacity(0.7)
                                Text("Bi").font(.system(size: 72, weight: .bold, design: .serif)).offset(x: 40, y: 17).opacity(0.9)
                            }.foregroundColor(Color.white)
                        }
                    }.padding()
                    Text("a little work with 🅱️")
                        .foregroundColor(Color.black.opacity(0.5))
                        .font(.system(size: 17, weight: .regular))
                        .italic()
                        .padding(.top, 16)
                        .padding(.bottom, 16)
                }
            }
        }.animation(.easeInOut)
        
    }
    
}

//            WebView(request: URLRequest(url: URL(string: "https://www.youtube.com/embed/Xys5wvaDUnQ?autoplay=1&modestbranding=0&autohide=1&title=1&controls=0")!))
//                .frame(height: 300, alignment: .center)

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
