//
//  LyricsCellView.swift
//  LiZhiZhuangbi
//
//  Created by Frad LEE on 8/30/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI
import Combine

struct LyricsCellView: View {
    var lyrics: Lyrics
    
    var body: some View {
        HStack {
            Text(LyricsCellViewModel(lyrics: lyrics).getLyrics())
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
