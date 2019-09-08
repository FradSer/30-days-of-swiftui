//
//  ContentView.swift
//  AppStoreLikeAnimation
//
//  Created by Frad LEE on 9/8/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
        Rectangle()
            .foregroundColor(Color("BackgroundColor"))
            .edgesIgnoringSafeArea(.all)
        Text("Hello World")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
