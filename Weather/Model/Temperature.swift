//
//  Temperature.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import RealmSwift

@objcMembers
class Temperature: Object, Codable {

    dynamic var min = 0.0
    dynamic var max = 0.0
}
