//
//  Weather.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import RealmSwift

@objcMembers
class Weather: Object, Codable {

    dynamic var id = 0
    dynamic var main = ""
    dynamic var shortDescription = ""
    dynamic var icon = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case main
        case shortDescription = "description"
        case icon
    }
}
