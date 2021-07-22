//
//  DateFormatterTests.swift
//  WeatherTests
//
//  Created by Burhanuddin Sunelwala on 22/07/21.
//

import XCTest

class DateFormatterTests: XCTestCase {

    var dateFormatter: DateFormatter!
    var date: Date!
    
    override func setUp() {
        
        date = Date(timeIntervalSince1970: 1626955848)
    }
    
    func testDayFormat() throws {
        dateFormatter = .day
        XCTAssertEqual(dateFormatter.string(from: date), "Thu Jul 22")
    }
    
    func testTimeFormat() throws {
        dateFormatter = .time
        XCTAssertEqual(dateFormatter.string(from: date), "16:10")
    }
    
    func testShorDateFormat() throws {
        dateFormatter = .shortDate
        XCTAssertEqual(dateFormatter.string(from: date), "22 Jul")
    }
}
