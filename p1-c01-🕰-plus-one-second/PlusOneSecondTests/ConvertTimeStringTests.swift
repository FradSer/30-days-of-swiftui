//
//  ConvertTimeStringTests.swift
//  PlusOneSecondTests
//
//  Created by Claude on 7/15/25.
//

import Testing
@testable import PlusOneSecond

struct ConvertTimeStringTests {
    
    @Test func testBasicFormatting() {
        #expect(convertTimeString(for: 0.0) == "0.0")
        #expect(convertTimeString(for: 1.0) == "1.0")
        #expect(convertTimeString(for: 123.4) == "123.4")
    }
    
    @Test func testRounding() {
        #expect(convertTimeString(for: 123.456) == "123.5")
        #expect(convertTimeString(for: 123.444) == "123.4")
        #expect(convertTimeString(for: 123.45) == "123.5")
    }
    
    @Test func testEdgeCases() {
        #expect(convertTimeString(for: -0.0) == "-0.0")
        #expect(convertTimeString(for: -123.456) == "-123.5")
        #expect(convertTimeString(for: 999.999) == "1000.0")
    }
    
    @Test func testVeryLargeNumbers() {
        #expect(convertTimeString(for: 999999.9) == "999999.9")
        #expect(convertTimeString(for: 1234567.8) == "1234567.8")
    }
    
    @Test func testVerySmallNumbers() {
        #expect(convertTimeString(for: 0.01) == "0.0")
        #expect(convertTimeString(for: 0.05) == "0.1")
        #expect(convertTimeString(for: 0.09) == "0.1")
    }
    
    @Test func testSpecialValues() {
        // Test infinity values - Swift's String(format:) handles these
        let infString = convertTimeString(for: Double.infinity)
        let negInfString = convertTimeString(for: -Double.infinity)
        let nanString = convertTimeString(for: Double.nan)
        
        #expect(infString == "inf")
        #expect(negInfString == "-inf")
        #expect(nanString == "nan" || nanString.lowercased() == "nan")
    }
}