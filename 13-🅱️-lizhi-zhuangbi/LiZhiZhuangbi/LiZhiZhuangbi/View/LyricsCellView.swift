//
//  LyricsCellView.swift
//  LiZhiZhuangbi
//
//  Created by Frad LEE on 8/30/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI
import Combine

let zhuangbiRed: Color = Color(red: 239/55, green: 40/255, blue: 24/255)

struct LyricsCellView: View {
    var lyrics: Lyrics
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("——《" + LyricsCellViewModel(lyrics: lyrics).getTitle() + "》")
                        .font(Font.custom("SourceHanSerifSC-Heavy", size: 32)).foregroundColor(zhuangbiRed).padding()
                }
            }
            Text(LyricsCellViewModel(lyrics: lyrics).getLyrics())
                .font(Font.custom("SourceHanSerifSC-Heavy", size: 40))
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#if DEBUG
let lyrics = Lyrics(id: 0, lyrics: "lyrics", title: "title", videoID: "videoID")

struct LyricsCellView_Previews: PreviewProvider {
    static var previews: some View {
        LyricsCellView(lyrics: lyrics)
    }
}
#endif
