//
//  ContentView.swift
//  PlusOneSecond
//
//  Created by Frad LEE on 8/4/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State var timeCount: Double = 0.0
    @State var clickCouut: Int = 0
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {timer in
            self.timeCount += 0.1
        }
    }
    
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            ZStack {
                VStack {
                    HStack {
                        Group {
                            Text(timeString(time: timeCount))
                                .font(.system(size: 100, weight: .black))
                                .italic()
                                .foregroundColor(Color.white)
                                .onAppear(perform: {
                                    let _ = self.timer
                                })

                            Text("s")
                                .font(.system(size: 60, weight: .black))
                                .italic()
                                .foregroundColor(Color.white)
                                .padding(.top)
                        }
                        .shadow(color: Color.black.opacity(0.25), radius: 16, x: 0, y: 4)
                    }
                    .padding(.top, 120)
                    
                    Spacer()
                    
                    VStack {
                        Button(action: {
                            self.timeCount += 1.0
                            self.clickCouut += 1
                            print("Total plus:", self.clickCouut)
                        }) {
                            Text("+1s")
                                .font(.system(size: 34, weight: .black))
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 190, height:80)
                        .background(Color.green)
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.25), radius: 16, x: 0, y: 4)
                        
                        Text("a little work with 🕰")
                            .foregroundColor(Color.black.opacity(0.5))
                            .font(.system(size: 17, weight: .regular))
                            .italic()
                            .padding(.top, 16)
                            .padding(.bottom, 16)
                    }
                }
            }
        }
    }
    func timeString(time: Double) -> String {
        return String(format: "%.1f", time)
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
