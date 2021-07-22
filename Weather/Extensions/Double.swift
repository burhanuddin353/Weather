//
//  Double.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import Foundation

extension Double {

    var roundedInt: Int {
        Int(Darwin.round(self))
    }
}
