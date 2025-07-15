//
//  TimerViewModel.swift
//  PlusOneSecond
//
//  Created by Claude on 7/15/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class TimerViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var timeCount: Double = 0.0
    @Published var clickCount: Int = 0
    @Published var isRunning: Bool = true
    @Published var isPaused: Bool = false
    
    // MARK: - Private Properties
    private var timer: Timer?
    private let timerInterval: Double = 0.1
    
    // MARK: - Timer Management
    func startTimer() {
        guard timer == nil else { return }
        
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { [weak self] _ in
            Task { @MainActor in
                self?.updateTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func pauseResumeTimer() {
        isPaused.toggle()
        isRunning = !isPaused
    }
    
    func resetTimer() {
        timeCount = 0.0
        clickCount = 0
        isRunning = true
        isPaused = false
    }
    
    func addSecond() {
        timeCount += 1.0
        clickCount += 1
    }
    
    // MARK: - Private Methods
    private func updateTimer() {
        if isRunning && !isPaused {
            timeCount += timerInterval
        }
    }
    
    // MARK: - Deinitialization
    deinit {
        Task { @MainActor in
            stopTimer()
        }
    }
}