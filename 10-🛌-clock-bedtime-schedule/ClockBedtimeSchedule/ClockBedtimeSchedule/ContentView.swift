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
    
    @State var totalLocation: CGPoint
    @State var totalStartLocation: CGPoint
    @State var sleepLocation: CGPoint
    @State var sleepStartLocation: CGPoint
    @State var wakeupLocation: CGPoint
    @State var wakeupStartLocation: CGPoint
    
    var body: some View {
        var isFix: Bool = false
        if getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation) > getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation) {
            isFix = true
        }
        
        let totalDragGesture = DragGesture()
            .onChanged {
            self.totalStartLocation = $0.startLocation
            self.totalLocation = $0.location
        }
        
        let sleepDragGesture = DragGesture()
           .onChanged {
            self.sleepStartLocation = $0.startLocation
            self.sleepLocation = $0.location
       }
        
        let wakeupDragGesture = DragGesture()
           .onChanged {
            self.wakeupStartLocation = $0.startLocation
            self.wakeupLocation = $0.location
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
                            .trim(
                                from: CGFloat((isFix ? getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation) : getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation)) / 360.0),
                                to: CGFloat((isFix ? getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation) : getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation)) / 360.0)
                            )
                            .stroke(
                                AngularGradient(
                                    gradient: Gradient(colors: isFix ? [endColor, startColor] : [startColor, endColor]),
                                    center: .center,
                                    startAngle: .degrees(isFix ? getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation) : getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation)),
                                    endAngle: .degrees(isFix ? getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation) : getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation))
                                ),
                                style: StrokeStyle(lineWidth: 40, lineCap: .round)
                            )
                        ZStack {
                            
                            // BELL
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.black)
                                Image(systemName: "bell.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(endColor).rotationEffect(.degrees(-getTotalAngles(start: totalStartLocation, end: totalLocation)-getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation)))
                            }
                            .offset(x: 157)
                            .rotationEffect(.degrees(getSleepWakeupAngles(start: wakeupStartLocation, end: wakeupLocation)))
                            .gesture(wakeupDragGesture)
                            
                            // ZZZ
                            ZStack {
                                Circle()
                                    .foregroundColor(Color.black)
                                Image(systemName: "zzz")
                                    .font(.system(size: 20))
                                    .foregroundColor(startColor).rotationEffect(.degrees(-getTotalAngles(start: totalStartLocation, end: totalLocation)-getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation)))
                            }
                            .offset(x: 157)
                            .rotationEffect(.degrees(getSleepWakeupAngles(start: sleepStartLocation, end: sleepLocation)))
                            .gesture(sleepDragGesture)
                            
                        }
                        .frame(width: 36, height: 36, alignment: .center)
                    }
                    .frame(width: 314, height: 314)
                }
                .rotationEffect(.degrees(getTotalAngles(start: totalStartLocation, end: totalLocation)))
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

func getTotalAngles(start: CGPoint, end: CGPoint) -> Double {
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

func getSleepWakeupAngles(start: CGPoint, end: CGPoint) -> Double {
    let middle = CGPoint(x: 0, y: 0)
    
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
        ContentView(totalLocation: .zero, totalStartLocation: .zero, sleepLocation: .zero, sleepStartLocation: .zero, wakeupLocation: .zero, wakeupStartLocation: .zero)
    }
}
#endif
