//
//  ContentView.swift
//  LottieShowcase
//
//  Created by Frad LEE on 9/4/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LottieView(fileName: "LottieTest")
                .frame(width: 300, height: 300)
//            Button(action: {}) {
//            Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
//            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
