//
//  TemperatureUnit.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 22/07/21.
//

import Foundation

enum TemperatureUnit: Int {

    case celsius = 0
    case fahrenheit = 1

    var suffix: String {
        switch self {
        case .celsius: return "°C"
        case .fahrenheit: return "°F"
        }
    }

    func toCelsius(_ fahrenheit: Double) -> Double {
        (fahrenheit - 32) * (5 / 9)
    }

    func toFahrenheit(_ celsius: Double) -> Double {
        (celsius * (9 / 5)) + 32
    }

    func conversionFormula(to unit: TemperatureUnit) -> ((Double) -> (Double)) {

        switch unit {
        case .fahrenheit: return toFahrenheit(_:)
        case .celsius: return toCelsius(_:)
        }
    }
}
