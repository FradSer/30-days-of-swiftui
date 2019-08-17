//
//  ContentView.swift
//  BreathingAnimation
//
//  Created by Frad LEE on 8/17/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var scaleInOut = false
    @State var rotateInOut = false
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ZStack {
                    Group {
                        ZStack {
                            Circle()
                                .frame(width: 120, height: 120, alignment: .center)
                                .offset(y:-60)
                            Circle()
                                .frame(width: 120, height: 120, alignment: .center)
                                .offset(y:60)
                        }.foregroundColor(Color.green).opacity(0.5)
                    }
                    
                    Group {
                        ZStack {
                            Circle()
                                .frame(width: 120, height: 120, alignment: .center)
                                .offset(y:-60)
                            Circle()
                                .frame(width: 120, height: 120, alignment: .center)
                                .offset(y:60)
                        }.foregroundColor(Color.green).opacity(0.5).rotationEffect(.degrees(60))
                    }
                    
                    Group {
                        ZStack {
                            Circle()
                                .frame(width: 120, height: 120, alignment: .center)
                                .offset(y:-60)
                            Circle()
                                .frame(width: 120, height: 120, alignment: .center)
                                .offset(y:60)
                        }.foregroundColor(Color.green).opacity(0.5).rotationEffect(.degrees(120))
                    }
                }
                .rotationEffect(.degrees(rotateInOut ? 90 : 0))
                .scaleEffect(scaleInOut ? 1 : 1/8)
                .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/4))
                .onAppear() {
                    self.rotateInOut.toggle()
                    self.scaleInOut.toggle()
                }
                Spacer()
                Text("a little work with 🍀")
                    .foregroundColor(Color.white.opacity(0.5))
                    .font(.system(size: 17, weight: .regular))
                    .italic()
                    .padding(.top, 16)
                    .padding(.bottom, 16)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
