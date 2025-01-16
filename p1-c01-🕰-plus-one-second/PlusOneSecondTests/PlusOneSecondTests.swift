//
//  PlusOneSecondTests.swift
//  PlusOneSecondTests
//
//  Created by Frad LEE on 1/16/25.
//

import Testing

struct PlusOneSecondTests {
  @Test func testConvertTimeString() async throws {
    // Given
    let time = 123.456

    // Whenfor
    let formattedTime = convertTimeString(for: time)

    // Then
    #expect(formattedTime == "123.5")
  }
}
