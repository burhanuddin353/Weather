//
//  OneCallViewModelTests.swift
//  WeatherTests
//
//  Created by Burhanuddin Sunelwala on 22/07/21.
//

import XCTest
@testable import Weather

class OneCallViewModelTests: XCTestCase {

    func testCurrentLocationName() {

      let expectation = self.expectation(
        description: "Find location using geocoder")
      
      let viewModel = OneCallViewModel()

      viewModel.areaName.bind {
        if $0.caseInsensitiveCompare("Sharjah") == .orderedSame {
          expectation.fulfill()
        }
      }

      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        viewModel.getCurrentLocation { _ in }
      }

      waitForExpectations(timeout: 8, handler: nil)
    }
}
