//
//  Lyrics.swift
//  LiZhiZhuangbi
//
//  Created by Frad LEE on 8/29/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import Foundation

struct Lyrics: Identifiable, Decodable {
    
    public var id: Int
    public var lyrics: String
    public var title: String
    public var videoID: String
    
    var videoURL: URL? {
        let urlPrefix: String = String("https://www.youtube.com/embed/")
        return URL(string: urlPrefix + videoID)
    }

}
