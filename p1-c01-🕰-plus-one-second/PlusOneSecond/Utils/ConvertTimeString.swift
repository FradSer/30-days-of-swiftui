//
//  ConvertTimeString.swift
//  PlusOneSecond
//
//  Created by Frad LEE on 1/16/25.
//

import Foundation

// Helper function to format time as a string
// This function takes a Double value representing time in seconds
// and returns it as a formatted string with one decimal place.
//
// Parameters:
//   - time: A Double value that represents the time in seconds.
//
// Returns:
//   A String formatted to one decimal place.
//
// Example:
//   timeString(time: 123.456) returns "123.5"
func convertTimeString(for time: Double) -> String {
  return String(format: "%.1f", time)
}
