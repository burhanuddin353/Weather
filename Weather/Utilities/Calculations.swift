//
//  Calculations.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 22/07/21.
//

import Foundation

class CelsiusToFarenheit {
    
    static func getConvertedTemp(from temp: Double) -> Double {
        
        let unit = Settings.saved.temperatureUnit
        guard unit == .fahrenheit else { return temp }
        let formula = unit.conversionFormula(to: .fahrenheit)
        return formula(temp)
    }
}
