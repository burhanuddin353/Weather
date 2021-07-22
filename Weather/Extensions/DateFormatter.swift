//
//  DateFormatter.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import Foundation

public extension DateFormatter {

    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }

    static var day: DateFormatter {
        DateFormatter(dateFormat: "EEE MMM dd")
    }

    static var time: DateFormatter {
        DateFormatter(dateFormat: "HH:mm")
    }

    static var shortDate: DateFormatter {
        DateFormatter(dateFormat: "dd MMM")
    }
}
