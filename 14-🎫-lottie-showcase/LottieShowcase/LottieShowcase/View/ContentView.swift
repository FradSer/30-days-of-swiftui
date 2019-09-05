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
        ScrollView {
            ForEach(lottieList, id: \.self) { lottie in
                VStack(alignment: .center){
                    LottieView(fileName: lottie).frame(height: 200)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
