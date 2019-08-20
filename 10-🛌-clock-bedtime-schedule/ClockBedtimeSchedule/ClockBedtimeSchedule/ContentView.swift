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
    
    @State var totalViewState: CGPoint = CGPoint(x: 157, y: 314)
    @State var sleepViewState: CGPoint = CGPoint(x: 157, y: 314)
    @State var wakeupViewState: CGPoint = CGPoint(x: 314, y: 157)
    
    var body: some View {
        var isFix: Bool = false
        if getAngles(end: sleepViewState) > getAngles(end: wakeupViewState) {
            isFix = true
        }
        
        let totalDragGesture = DragGesture()
            .onChanged {
                self.totalViewState = $0.location
//                print("\(self.totalViewState)")
                
        }
        
        let sleepDragGesture = DragGesture()
           .onChanged {
            self.sleepViewState = CGPoint(x: $0.location.x + 157, y: $0.location.y)
               print("\(self.sleepViewState)")
               
       }
        
        let wakeupDragGesture = DragGesture()
           .onChanged {
               self.wakeupViewState = CGPoint(x: $0.location.x + 157, y: $0.location.y)
//               print("\(self.wakeupViewState)")
               
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
                            .trim(from: CGFloat((isFix ? getAngles(end: wakeupViewState) : getAngles(end: sleepViewState)) / 360.0), to: CGFloat((isFix ? getAngles(end: sleepViewState) : getAngles(end: wakeupViewState))  / 360.0))
                            .stroke(
                                AngularGradient(gradient: Gradient(colors: isFix ? [endColor, startColor] : [startColor, endColor]), center: .center, startAngle: .degrees(isFix ? getAngles(end: wakeupViewState) : getAngles(end: sleepViewState)), endAngle: .degrees(isFix ? getAngles(end: sleepViewState) : getAngles(end: wakeupViewState))),
                                style: StrokeStyle(lineWidth: 40, lineCap: .round))
                        ZStack {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.black)
                                Image(systemName: "bell.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(endColor).rotationEffect(.degrees(-getAngles(end: totalViewState)-getAngles(end: wakeupViewState)))
                            }
                            .offset(x: 157)
                            .rotationEffect(.degrees(getAngles(end: wakeupViewState)))
                            .gesture(wakeupDragGesture)
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.black)
                                Image(systemName: "zzz")
                                    .font(.system(size: 20))
                                    .foregroundColor(startColor).rotationEffect(.degrees(-getAngles(end: totalViewState)-getAngles(end: sleepViewState)))
                            }
                            .offset(x: 157)
                            .rotationEffect(.degrees(getAngles(end: sleepViewState)))
                            .gesture(sleepDragGesture)
                        }
                        .frame(width: 36, height: 36, alignment: .center)
                    }
                    .frame(width: 314, height: 314)
                }
                .rotationEffect(.degrees(getAngles(end: totalViewState)))
                .gesture(totalDragGesture)
                Spacer()
                Text("a little work with 🛌")
                    .foregroundColor(Color.white.opacity(0.75))
                    .font(.system(size: 17, weight: .regular))
                    .italic()
                    .padding(.top, 16)
                    .padding(.bottom, 16)
            }
        }
    }
}

func getAngles(end: CGPoint) -> Double {
    let start = CGPoint(x:314, y:157)
    let middle = CGPoint(x: 157, y: 157)
    
    let startX = start.x - middle.x
    let startY = start.y - middle.y
    let atanStart = atan2(startX, startY)
    
    let endX = end.x - middle.x
    let endY = end.y - middle.y
    let atanEnd = atan2(endX, endY)
    
    let angel = Double(atanStart - atanEnd) * 180 / Double.pi
    return angel
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
