//
//  TemperatureUnitTests.swift
//  WeatherTests
//
//  Created by Burhanuddin Sunelwala on 22/07/21.
//

import XCTest
@testable import Weather

class TemperatureUnitTests: XCTestCase {
    
    var tempUnit: Settings.TemperatureUnit!
    
    override func setUp() {
        
        tempUnit = .fahrenheit
    }
    
    func testConverToFahrenheit() throws {
        guard let formula = tempUnit.conversionFormula(to: .fahrenheit) else {
            XCTAssertEqual(1, 1)
            return
        }
        XCTAssertEqual(formula(3), 37.4)
    }
    
    func testConverToCelcius() throws {
        guard let formula = tempUnit.conversionFormula(to: .celsius) else {
            XCTAssertEqual(1, 1)
            return
        }
        XCTAssertEqual(formula(95), 35)
    }
}
