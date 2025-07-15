//
//  ContentView.swift
//  PlusOneSecond
//
//  Created by Frad LEE on 1/16/25.
//

import Foundation
import SwiftUI

// MARK: - Constants
private enum Constants {
  static let timerInterval: Double = 0.1
  static let timerTopPadding: CGFloat = 120
  static let buttonWidth: CGFloat = 190
  static let buttonHeight: CGFloat = 80
  static let buttonCornerRadius: CGFloat = 16
  static let shadowRadius: CGFloat = 16
  static let shadowOffset: CGFloat = 4
  static let timerFontSize: CGFloat = 100
  static let secondFontSize: CGFloat = 60
  static let buttonFontSize: CGFloat = 34
  static let visionOSTimerOffset: CGFloat = 32
  static let visionOSButtonOffset: CGFloat = 16
  static let verticalPadding: CGFloat = 16
}

struct ContentView: View {
  @StateObject private var viewModel = TimerViewModel()

  var body: some View {
    ZStack {
      background

      VStack {
        countdownTimer
          .padding(.top, Constants.timerTopPadding)
          .onAppear {
            viewModel.startTimer()
          }
          .onDisappear {
            viewModel.stopTimer()
          }
          #if os(visionOS)
            .offset(z: Constants.visionOSTimerOffset)
          #endif

        Spacer()

        VStack {
          HStack(spacing: 20) {
            pauseButton
            button
            resetButton
          }
          littleWork
        }
        #if os(visionOS)
          .offset(z: Constants.visionOSButtonOffset)
        #endif
      }
    }
  }
}

extension ContentView {
  // View displaying a text with a little work message
  private var littleWork: some View {
    Text("a little work with 🕰")
      .modifier(LittleWorkTextStyle())
      .accessibilityLabel("Timer application subtitle")
  }

  // Button that adds one second to the timer and increments click count
  private var button: some View {
    Button(action: {
      viewModel.addSecond()
    }) {
      Text("+1s")
        .modifier(ButtonTextStyle())
    }
    .modifier(PlusButtonStyle())
    .accessibilityIdentifier("plusOneSecondButton")
    .accessibilityLabel("Add one second")
    .accessibilityHint("Adds one second to the timer and increments click count")
  }
  
  // Pause/Resume button
  private var pauseButton: some View {
    Button(action: {
      viewModel.pauseResumeTimer()
    }) {
      Image(systemName: viewModel.isRunning ? "pause.fill" : "play.fill")
        .font(.system(size: Constants.buttonFontSize, weight: .black))
        .foregroundColor(.white)
    }
    .modifier(SecondaryButtonStyle())
    .accessibilityIdentifier("pauseButton")
    .accessibilityLabel(viewModel.isRunning ? "Pause" : "Resume")
  }
  
  // Reset button
  private var resetButton: some View {
    Button(action: {
      viewModel.resetTimer()
    }) {
      Image(systemName: "arrow.clockwise")
        .font(.system(size: Constants.buttonFontSize, weight: .black))
        .foregroundColor(.white)
    }
    .modifier(SecondaryButtonStyle())
    .accessibilityIdentifier("resetButton")
    .accessibilityLabel("Reset")
  }

  // Timer display with conditional formatting for iOS 15 and above
  private var countdownTimer: some View {
    HStack {
      Group {
        if #available(iOS 15.0, *) {
          Text(convertTimeString(for: viewModel.timeCount))
            .modifier(TimerTextStyle())
            .monospacedDigit()
            .accessibilityLabel("Timer: \(convertTimeString(for: viewModel.timeCount)) seconds")
        } else {
          Text(convertTimeString(for: viewModel.timeCount))
            .modifier(TimerTextStyle())
            .accessibilityLabel("Timer: \(convertTimeString(for: viewModel.timeCount)) seconds")
        }

        Text("s")
          .modifier(SecondTextStyle())
          .accessibilityHidden(true)
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
      .padding(.vertical, Constants.verticalPadding)
  }
}

// Modifier for styling the button text.
struct ButtonTextStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: Constants.buttonFontSize, weight: .black))
      .foregroundColor(Color.white)
  }
}

// Modifier for styling the button's appearance.
struct PlusButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
      .background(Color.green)
      .cornerRadius(Constants.buttonCornerRadius)
      .shadow(
        color: Color.black.opacity(0.25), radius: Constants.shadowRadius, x: 0, y: Constants.shadowOffset
      )
      #if !os(macOS)
      .hoverEffect(.highlight)
      #endif
      #if os(macOS)
      .buttonStyle(PlainButtonStyle())
      #endif
  }
}

// Modifier for styling secondary buttons
struct SecondaryButtonStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: Constants.buttonHeight, height: Constants.buttonHeight)
      .background(Color.orange)
      .cornerRadius(Constants.buttonCornerRadius)
      .shadow(
        color: Color.black.opacity(0.25), radius: Constants.shadowRadius, x: 0, y: Constants.shadowOffset
      )
      #if !os(macOS)
      .hoverEffect(.highlight)
      #endif
      #if os(macOS)
      .buttonStyle(PlainButtonStyle())
      #endif
  }
}

// Modifier for styling the timer text.
struct TimerTextStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: Constants.timerFontSize, weight: .black))
      .italic()
  }
}

// Modifier for styling the seconds text.
struct SecondTextStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: Constants.secondFontSize, weight: .black))
      .italic()
      .padding(.top)
  }
}

#Preview {
  ContentView()
}
