//
//  LyricsListViewModel.swift
//  LiZhiZhuangbi
//
//  Created by Frad LEE on 8/29/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public class LyricsListViewModel: ObservableObject {
    
    public let willChange = ObservableObjectPublisher()
    
    @Published var lyricsList = [Lyrics]() {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    func shuffle() {
        self.lyricsList = self.lyricsList.shuffled()
    }
    
    func load() {
        guard let url = URL(string: "https://api.sheety.co/636edc52-e022-40c0-b374-9f6b309782b4") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                
                guard let data = data else { return }
                let lyricsList = try JSONDecoder().decode([Lyrics].self, from: data)
                DispatchQueue.main.async {
                    self.lyricsList = lyricsList
                    print(lyricsList)
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
    }
    
    init() {
        load()
    }
}
