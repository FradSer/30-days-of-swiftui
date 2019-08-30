//
//  LyricsCellViewModel.swift
//  LiZhiZhuangbi
//
//  Created by Frad LEE on 8/30/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import Foundation

public class LyricsCellViewModel {
    private var lyrics: Lyrics
    
    init(lyrics: Lyrics) {
           self.lyrics = lyrics
       }
    
    func getLyrics() -> String {
        return self.lyrics.lyrics
    }
    
    func getTitle() -> String {
        return self.lyrics.title
    }
}
