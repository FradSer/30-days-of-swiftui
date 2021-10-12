//
//  ContentView.swift
//  PlusOneSecond
//
//  Created by Frad LEE on 8/4/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - ContentView

struct ContentView: View {
  // MARK: Internal

  @State var timeCount: Double = 0.0
  @State var clickCouut: Int = 0

  var body: some View {
    ZStack {
      background

      VStack {
        countdownTimer
          .padding(.top, 120)
          .onAppear(perform: {
            _ = self.timer
          })

        Spacer()

        VStack {
          button
          litteWork
        }
      }
    }
  }

  // MARK: Private

  private var timer: Timer {
    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
      self.timeCount += 0.1
    }
  }
}

extension ContentView {
  private var litteWork: some View {
    Text("a little work with 🕰")
      .foregroundColor(Color.black.opacity(0.5))
      .font(.system(size: 17, weight: .regular))
      .italic()
      .padding(.top, 16)
      .padding(.bottom, 16)
  }

  private var button: some View {
    Button(action: {
      self.timeCount += 1.0
      self.clickCouut += 1
      print("Total plus:", self.clickCouut)
    }) {
      Text("+1s")
        .font(.system(size: 34, weight: .black))
        .foregroundColor(Color.white)
    }
    .frame(width: 190, height: 80)
    .background(Color.green)
    .cornerRadius(16)
    .shadow(
      color: Color.black.opacity(0.25), radius: 16, x: 0, y: 4
    )
  }

  private var countdownTimer: some View {
    HStack {
      Group {
        if #available(iOS 15.0, *) {
          Text(timeString(time: timeCount))
            .font(.system(size: 100, weight: .black))
            .italic()
            .monospacedDigit()
        } else {
          Text(timeString(time: timeCount))
            .font(.system(size: 100, weight: .black))
            .italic()
        }

        Text("s")
          .font(.system(size: 60, weight: .black))
          .italic()
          .padding(.top)
      }

      .foregroundColor(Color.white)
      .shadow(
        color: Color.black.opacity(0.25),
        radius: 16,
        x: 0,
        y: 4
      )
    }
  }

  private var background: some View {
    Color.yellow
      .edgesIgnoringSafeArea(.all)
  }

  private func timeString(time: Double) -> String {
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
