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
        ScrollView() {
            CardView()
            CardView()
            CardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
