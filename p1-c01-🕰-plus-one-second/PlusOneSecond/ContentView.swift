//
//  ContentView.swift
//  PlusOneSecond
//
//  Created by Frad LEE on 1/16/25.
//

import Foundation
import SwiftUI

struct ContentView: View {
  // State variables to track time and button clicks
  @State var timeCount: Double = 0.0
  @State var clickCount: Int = 0

  var body: some View {
    ZStack {
      background

      VStack {
        countdownTimer
          .padding(.top, 120)
          .onAppear(perform: {
            // Start the timer when the view appears
            _ = self.timer
          })
          #if os(visionOS)
            .offset(z: 32)
          #endif

        Spacer()

        VStack {
          button
          littleWork
        }
        #if os(visionOS)
          .offset(z: 16)
        #endif
      }
    }
  }
}

extension ContentView {
  // Timer that increments timeCount every 0.1 seconds
  private var timer: Timer {
    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
      self.timeCount += 0.1
    }
  }

  // View displaying a text with a little work message
  private var littleWork: some View {
    Text("a little work with 🕰")
      .modifier(LittleWorkTextStyle())
  }

  // Button that adds one second to the timer and increments click count
  private var button: some View {
    Button(action: {
      self.timeCount += 1.0
      self.clickCount += 1
      print("Total plus:", self.clickCount)
    }) {
      Text("+1s")
        .modifier(ButtonTextStyle())
    }
    .modifier(ButtonStyle())
    .accessibilityIdentifier("plusOneSecondButton")
  }

  // Timer display with conditional formatting for iOS 15 and above
  private var countdownTimer: some View {
    HStack {
      Group {
        if #available(iOS 15.0, *) {
          Text(convertTimeString(for: timeCount))
            .modifier(TimerTextStyle())
            .monospacedDigit()
        } else {
          Text(convertTimeString(for: timeCount))
            .modifier(TimerTextStyle())
        }

        Text("s")
          .modifier(SecondTextStyle())
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

  // Background color for the view
  private var background: some View {
    Color.accentColor
      .edgesIgnoringSafeArea(.all)
  }
}

// Custom modifiers for styling

// Modifier for styling text that indicates a small amount of work being done.
struct LittleWorkTextStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(Color.black.opacity(0.5))
      .font(.body)
      .italic()
      .padding(.vertical, 16)
  }
}

// Modifier for styling the button text.
struct ButtonTextStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 34, weight: .black))
      .foregroundColor(Color.white)
  }
}

// Modifier for styling the button's appearance.
struct ButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: 190, height: 80)
      .background(Color.green)
      .cornerRadius(16)
      .shadow(
        color: Color.black.opacity(0.25), radius: 16, x: 0, y: 4
      )
      .hoverEffect(.highlight)
  }
}

// Modifier for styling the timer text.
struct TimerTextStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 100, weight: .black))
      .italic()
  }
}

// Modifier for styling the seconds text.
struct SecondTextStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 60, weight: .black))
      .italic()
      .padding(.top)
  }
}

#Preview {
  ContentView()
}
