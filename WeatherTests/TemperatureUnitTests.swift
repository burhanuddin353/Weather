//
//  TemperatureUnitTests.swift
//  WeatherTests
//
//  Created by Burhanuddin Sunelwala on 22/07/21.
//

import XCTest
@testable import Weather

class TemperatureUnitTests: XCTestCase {
    
    var tempUnit: TemperatureUnit!
    
    override func setUp() {
        tempUnit = .fahrenheit
    }
    
    func testConverToFahrenheit() throws {
        let formula = tempUnit.conversionFormula(to: .fahrenheit)
        XCTAssertEqual(formula(3), 37.4)
    }
    
    func testConverToCelcius() throws {
        let formula = tempUnit.conversionFormula(to: .celsius)
        XCTAssertEqual(formula(95), 35)
    }
}
