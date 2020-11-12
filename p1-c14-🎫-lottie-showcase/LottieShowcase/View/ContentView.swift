//
//  ContentView.swift
//  LottieShowcase
//
//  Created by Frad LEE on 9/4/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

let backgroundColor: Color = Color(red: 229/255, green: 240/255, blue: 239/255)

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(backgroundColor)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView {
                    ForEach(lottieList, id: \.self) { lottie in
                        VStack(alignment: .center){
                            LottieView(fileName: lottie).frame(height: 200)
                        }
                    }
                }
                Text("a little work with 🎫")
                    .foregroundColor(Color.black.opacity(0.5))
                    .font(.system(size: 17, weight: .regular))
                    .italic()
                    .padding(.top, 16)
                    .padding(.bottom, 16)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
