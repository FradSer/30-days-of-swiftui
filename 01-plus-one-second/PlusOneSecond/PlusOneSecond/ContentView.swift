//
//  ContentView.swift
//  PlusOneSecond
//
//  Created by Frad LEE on 8/4/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

// https://medium.com/@max.codes/build-a-basic-counter-app-with-swiftui-in-xcode-11-6b5d895830e7
// https://medium.com/ios-os-x-development/build-an-stopwatch-with-swift-3-0-c7040818a10f
// https://medium.com/better-programming/make-a-simple-countdown-with-timer-and-swiftui-3ce355b54986

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State var timeCount: Double = 0.0
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) {_ in self.timeCount = Double()}
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
//                                    let _ = self.timer
                                    self.timeCount += 0.01
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
                        Button(action: {self.timeCount += 1.0}) {
                            Text("+1 s")
                                .font(.system(size: 34, weight: .black))
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 190, height:80)
                        .background(Color.green)
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.25), radius: 16, x: 0, y: 4)
                        
                        Text("a little work")
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
        return String(format: "%.2f", time)
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
