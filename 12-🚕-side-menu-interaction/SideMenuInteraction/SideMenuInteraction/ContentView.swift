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
    
    var menuListIcon: String = "menu.list"
    
    var dynamicMenuListImage: UIImage {
        let configuration = UIImage.SymbolConfiguration(textStyle: .body, scale: .large)
        let image = UIImage(named: menuListIcon) ?? UIImage()
        return image.withConfiguration(configuration)
    }
    
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: sideMenuActived ? 32 : 0)
                    .foregroundColor(Color.green)
                    .shadow(radius: sideMenuActived ? 32 : 0)
                VStack {
                    HStack {
                        Button(action: {self.sideMenuActived.toggle()}) {
                            Image(uiImage: dynamicMenuListImage)
                                .accentColor(Color.white).frame(width: 44, height: 44, alignment: .center)
                        }.padding(.leading, 32).padding(.top, 64)
                        Spacer()
                    }
                    Spacer()
                }
            }
            .offset(x: sideMenuActived ? 354 : 0)
            .scaleEffect(sideMenuActived ? 0.8 : 1)
        }
        .animation(.spring()).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
