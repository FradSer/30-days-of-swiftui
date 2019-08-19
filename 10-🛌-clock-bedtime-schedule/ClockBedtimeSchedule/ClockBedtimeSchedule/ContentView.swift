//
//  ContentView.swift
//  ClockBedtimeSchedule
//
//  Created by Frad LEE on 8/19/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

let startColor: Color = Color(red:1.00, green:0.63, blue:0.05)
let endColor: Color = Color(red:1.00, green:0.83, blue:0.03)

struct ContentView: View {
    @State var sleepDegress: Double
    @State var wakeupDegress: Double
    @State var totalDegress: Double
    
    var body: some View {
        var isFix: Bool = false
        if sleepDegress >= wakeupDegress {
            isFix = true
        }
        return ZStack {
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.2), lineWidth: 40)
                        .frame(width: 314, height: 314)
                    ZStack {
                        Circle()
                            .trim(from: CGFloat(isFix ? 0.0 : sleepDegress) / 360.0, to: CGFloat(isFix ? 360 - (sleepDegress - wakeupDegress) : wakeupDegress) / 360.0)
                            .stroke(
                                AngularGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startAngle: .degrees(isFix ? 0.0 : sleepDegress), endAngle: .degrees(isFix ? 360 - (sleepDegress - wakeupDegress): wakeupDegress)),
                                style: StrokeStyle(lineWidth: 40, lineCap: .round))
                            .frame(width: 314, height: 314)
                            .rotationEffect(.degrees(isFix ? sleepDegress : 0.0))
                        ZStack {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.black)
                                Image(systemName: "bell.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(endColor).rotationEffect(.degrees(-totalDegress-wakeupDegress))
                            }.offset(x: 157).rotationEffect(.degrees(wakeupDegress))
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.black)
                                Image(systemName: "zzz")
                                    .font(.system(size: 20))
                                    .foregroundColor(startColor).rotationEffect(.degrees(-totalDegress-sleepDegress))
                            }.offset(x: 157).rotationEffect(.degrees(sleepDegress))
                        }
                        .frame(width: 36, height: 36, alignment: .center)
                    }
                }
                .rotationEffect(.degrees(totalDegress))
                Spacer()
                VStack {
                    Slider(value: $sleepDegress, in: 0.0...360.0, step: 1.0)
                    Slider(value: $wakeupDegress, in: 0.0...360.0, step: 1.0)
                    Slider(value: $totalDegress, in: 0.0...360.0, step: 1.0)
                }.accentColor(Color.white).padding(.all, 32)
                Text("a little work with 🛌")
                    .foregroundColor(Color.white.opacity(0.75))
                    .font(.system(size: 17, weight: .regular))
                    .italic()
                    .padding(.top, 16)
                    .padding(.bottom, 16)
            }
        }
//        func laterWakeup(sleep: Double, wakeup: Double) -> Double {
//            var time: Double
//            if (sleep > wakeup) {
//                time = sleep
//            } else {
//                time = wakeup
//            }
//            return time
//        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(sleepDegress: 0.0, wakeupDegress: 45.0, totalDegress: 0.0)
    }
}
#endif
