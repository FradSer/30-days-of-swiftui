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
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.25), lineWidth: 40)
                        .frame(width: 314, height: 314)
                    ZStack {
                        Circle()
                            .trim(from: 0.25, to: 1.0)
                            .stroke(
                                AngularGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startAngle: .degrees(0), endAngle: .degrees(-270)),
                                style: StrokeStyle(lineWidth: 40, lineCap: .round))
                            .frame(width: 314, height: 314)
                        Circle()
                            .foregroundColor(Color.black)
                            .frame(width: 34, height: 34, alignment: .center)
                            .offset(x: 157)
                        Circle()
                            .foregroundColor(Color.black)
                            .frame(width: 34, height: 34, alignment: .center)
                            .offset(y: 157)
                    }
                }
                .rotationEffect(.degrees(90))
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

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
