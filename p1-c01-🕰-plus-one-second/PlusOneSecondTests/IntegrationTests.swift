//
//  IntegrationTests.swift
//  PlusOneSecondTests
//
//  Created by Claude on 7/15/25.
//

import Testing
import SwiftUI
@testable import PlusOneSecond

@MainActor
struct IntegrationTests {
    
    @Test func testContentViewInitialization() {
        let contentView = ContentView()
        let _ = contentView.body
        
        // Basic smoke test - if we get here, initialization succeeded
        #expect(true)
    }
    
    @Test func testButtonStyling() {
        let plusButton = Button(action: {}) {
            Text("+1s")
        }
        .modifier(PlusButtonStyle())
        
        let secondaryButton = Button(action: {}) {
            Image(systemName: "pause.fill")
        }
        .modifier(SecondaryButtonStyle())
        
        // Verify styling doesn't crash - basic smoke test
        let _ = plusButton
        let _ = secondaryButton
    }
    
    @Test func testTextStyling() {
        let timerText = Text("123.4")
            .modifier(TimerTextStyle())
        
        let buttonText = Text("+1s")
            .modifier(ButtonTextStyle())
        
        let littleWorkText = Text("test")
            .modifier(LittleWorkTextStyle())
        
        // Verify styling doesn't crash - basic smoke test
        let _ = timerText
        let _ = buttonText
        let _ = littleWorkText
    }
    
}
