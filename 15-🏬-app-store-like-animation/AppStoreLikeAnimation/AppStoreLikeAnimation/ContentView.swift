//
//  ContentView.swift
//  AppStoreLikeAnimation
//
//  Created by Frad LEE on 9/8/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

// MARK: - Setup
extension CGRect {
    var center: CGPoint { return CGPoint(x: midX, y: midY) }
}


// MARK: - Content View
struct ContentView: View {
    var body: some View {
        CardListView()
    }
}

// MARK: - Card List View
struct CardListView: View {
    
    @State var cardActived: Bool = false
    
    var body: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { _ in
                CardCellView()
            }
        }
        .statusBar(hidden: cardActived ? true : false)
        .edgesIgnoringSafeArea(cardActived ? .all : .init())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var cardIsActived: Bool = true
    static var previews: some View {
        ContentView()
    }
}
