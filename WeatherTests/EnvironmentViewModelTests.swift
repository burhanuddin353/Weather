//
//  EnvironmentViewModelTests.swift
//  WeatherTests
//
//  Created by Burhanuddin Sunelwala on 22/07/21.
//

import XCTest
@testable import Weather

class EnvironmentViewModelTests: XCTestCase {
    
    let viewModel = EnvironmentViewModel()
    
    override func setUp() {}
    
    func testConverToFahrenheit() throws {
        XCTAssertEqual(viewModel.environment.value, "Development")
    }
}
