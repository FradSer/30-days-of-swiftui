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
    @State var moveInOut = false
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ZStack {
                    ZStack {
                        Group {
                            Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                        }
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? -60 : 0)
                        Group {
                            Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                        }
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? 60 : 0)
                    }
                    .opacity(0.5)
                    ZStack {
                        Group {
                            Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                        }
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? -60 : 0)
                        Group {
                            Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                        }
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? 60 : 0)
                    }
                    .opacity(0.5).rotationEffect(.degrees(60))
                    ZStack {
                        Group {
                            Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom))
                        }
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? -60 : 0)
                        Group {
                            Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .bottom, endPoint: .top))
                        }
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: moveInOut ? 60 : 0)
                    }
                    .opacity(0.5).rotationEffect(.degrees(120))
                }
                .rotationEffect(.degrees(rotateInOut ? 90 : 0))
                .scaleEffect(scaleInOut ? 1 : 1/4)
                .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8))
                .onAppear() {
                    self.rotateInOut.toggle()
                    self.scaleInOut.toggle()
                    self.moveInOut.toggle()
                }
                Spacer()
                Text("a little work with 🍀")
                    .foregroundColor(Color.white.opacity(0.75))
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
