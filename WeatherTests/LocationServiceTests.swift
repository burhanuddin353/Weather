//
//  LocationServiceTests.swift
//  WeatherTests
//
//  Created by Burhanuddin Sunelwala on 22/07/21.
//

import XCTest
import CoreLocation
@testable import Weather

class LocationServiceTests: XCTestCase {
    
    func testSharjahLocation() {
        
        let expectation = self.expectation(
            description: "Check for Sharjah Location")
        
        let service = LocationService()
        let location = CLLocation(latitude: 25.351307, longitude: 55.396977)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            service.getLocation(for: location) {
                if $0?.name.caseInsensitiveCompare("Sharjah") == .orderedSame {
                    expectation.fulfill()
                }
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testDubaiLocation() {
        
        let expectation = self.expectation(
            description: "Check for Dubai Location")
        
        let service = LocationService()
        let location = CLLocation(latitude: 25.0644145, longitude: 55.1381989)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            service.getLocation(for: location) {
                if $0?.name.caseInsensitiveCompare("Dubai") == .orderedSame {
                    expectation.fulfill()
                }
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
