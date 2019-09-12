//
//  ContentView.swift
//  AppStoreLikeAnimation
//
//  Created by Frad LEE on 9/8/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var actived = false
    
    var body: some View {
        ScrollView() {
            ForEach(0..<5, id: \.self) { _ in
                CardView(cardActived: false)
                .onTapGesture { self.actived.toggle() }
            }
            if self.actived {
                CardView(cardActived: true)
                    .zIndex(1)
                    .onTapGesture {
                        self.actived.toggle()
                }
            }
        }
        .statusBar(hidden: actived ? true : false)
        .edgesIgnoringSafeArea(actived ? .all : .horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
