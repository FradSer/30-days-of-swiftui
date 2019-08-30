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
            VStack {
                List(lyricsLisViewModel.lyricsList.shuffled()) { lyrics in
                    HStack {
                        Text(lyrics.lyrics)
                        Text(lyrics.title)
                    }
                }
                Button(action: {
                    self.lyricsLisViewModel.shuffle()
                }) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                Spacer()
                LyricsCellView(lyrics: lyricsLisViewModel.lyricsList.shuffled().first ?? defaultLyrics)
            }
        }
        
    }
    
}


//            WebView(request: URLRequest(url: URL(string: "https://www.youtube.com/embed/Xys5wvaDUnQ?autoplay=1&modestbranding=0&autohide=1&title=1&controls=0")!))
//                .frame(height: 300, alignment: .center)

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
