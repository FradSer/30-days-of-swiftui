//
//  TimerViewModelTests.swift
//  PlusOneSecondTests
//
//  Created by Claude on 7/15/25.
//

import Testing
@testable import PlusOneSecond

@MainActor
struct TimerViewModelTests {
    
    @Test func testInitialState() {
        let viewModel = TimerViewModel()
        
        #expect(viewModel.timeCount == 0.0)
        #expect(viewModel.clickCount == 0)
        #expect(viewModel.isRunning == true)
        #expect(viewModel.isPaused == false)
    }
    
    @Test func testAddSecond() {
        let viewModel = TimerViewModel()
        
        viewModel.addSecond()
        
        #expect(viewModel.timeCount == 1.0)
        #expect(viewModel.clickCount == 1)
    }
    
    @Test func testAddMultipleSeconds() {
        let viewModel = TimerViewModel()
        
        for i in 1...5 {
            viewModel.addSecond()
            #expect(viewModel.timeCount == Double(i))
            #expect(viewModel.clickCount == i)
        }
    }
    
    @Test func testResetTimer() {
        let viewModel = TimerViewModel()
        
        // Setup some state
        viewModel.addSecond()
        viewModel.addSecond()
        viewModel.pauseResumeTimer()
        
        // Reset
        viewModel.resetTimer()
        
        #expect(viewModel.timeCount == 0.0)
        #expect(viewModel.clickCount == 0)
        #expect(viewModel.isRunning == true)
        #expect(viewModel.isPaused == false)
    }
    
    @Test func testPauseResumeTimer() {
        let viewModel = TimerViewModel()
        
        // Initial state
        #expect(viewModel.isRunning == true)
        #expect(viewModel.isPaused == false)
        
        // First pause
        viewModel.pauseResumeTimer()
        #expect(viewModel.isRunning == false)
        #expect(viewModel.isPaused == true)
        
        // Resume
        viewModel.pauseResumeTimer()
        #expect(viewModel.isRunning == true)
        #expect(viewModel.isPaused == false)
    }
    
    @Test func testTimerStartStop() {
        let viewModel = TimerViewModel()
        
        // Ensure timer is not started on init
        viewModel.stopTimer()
        
        // Start timer
        viewModel.startTimer()
        #expect(viewModel.timeCount == 0.0) // Should start from 0
        
        // Stop timer
        viewModel.stopTimer()
        
        // Verify no crashes
        viewModel.stopTimer() // Should be safe to call twice
    }
    
    @Test func testDeinitialization() {
        var viewModel: TimerViewModel? = TimerViewModel()
        viewModel?.startTimer()
        
        // Should not crash when deinitialized
        viewModel = nil
        
        // If we get here, deinit worked properly
        #expect(true)
    }
    
    @Test func testTimeCountWithPrecision() {
        let viewModel = TimerViewModel()
        
        // Test with floating point precision
        viewModel.timeCount = 123.456
        viewModel.addSecond()
        #expect(viewModel.timeCount == 124.456)
        
        viewModel.timeCount = 0.1
        viewModel.addSecond()
        #expect(viewModel.timeCount == 1.1)
    }
    
    @Test func testNegativeTimeHandling() {
        let viewModel = TimerViewModel()
        
        // Test setting negative time
        viewModel.timeCount = -5.0
        viewModel.addSecond()
        #expect(viewModel.timeCount == -4.0)
    }
}