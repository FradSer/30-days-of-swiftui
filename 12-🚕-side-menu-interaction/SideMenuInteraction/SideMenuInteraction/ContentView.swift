//
//  ContentView.swift
//  SideMenuInteraction
//
//  Created by Frad LEE on 8/28/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sideMenuActived: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            ZStack {
                RoundedRectangle(cornerRadius: sideMenuActived ? 32 : 0)
                    .foregroundColor(Color.green)
                    .shadow(radius: sideMenuActived ? 32 : 0)
                VStack {
                    HStack {
                        Button(action: {self.sideMenuActived.toggle()}) {
                            Image(uiImage: menuListImage).accentColor(Color.white)
                                .frame(width: 44, height: 44, alignment: .center)
                                .scaleEffect(sideMenuActived ? 1.2 : 1)
                        }.padding(.top, 64).padding(.leading, 32)
                        Spacer()
                    }
//                    HStack {
//                        Spacer()
//                    }
                    Spacer()
                }
            }
            .offset(x: sideMenuActived ? 354 : 0)
            .scaleEffect(sideMenuActived ? 0.7 : 1)
            .animation(.spring(response: 0.5)).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("a little work with 🚕")
                .foregroundColor(Color.black.opacity(0.5))
                .font(.system(size: 17, weight: .regular))
                .italic()
                .padding(16)
            }
        }
        
        
    }
}

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Spacer()
                .background(Color(red: 232/255, green: 237/255, blue: 233/255)).edgesIgnoringSafeArea(.all)
            HStack {
//                Image(uiImage: heartImage)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
