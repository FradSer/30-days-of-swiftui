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

struct ContentView: View {
    
    @State var cardActived: Bool = false
    @State var sourceRect: CGRect? = nil
    
    var body: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { _ in
                CardView()
                .onTapGesture {
                    self.cardActived = true
                }
            }
            if self.cardActived {
                CardView()
                    .zIndex(1)
                    .position(x: screenSize.midX, y: screenSize.midY)
                    .onTapGesture {
                        self.cardActived = false
                }
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
