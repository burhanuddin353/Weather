//
//  NSNotification.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 21/07/21.
//

import Foundation

extension Notification.Name {

    static let temperatureUnitChanged = Notification.Name(rawValue: "temperatureUnitChanged")
    static let performBackgroundFetch = Notification.Name(rawValue: "performBackgroundFetch")
}
