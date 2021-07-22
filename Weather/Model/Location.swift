//
//  Location.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import CoreLocation
import RealmSwift

@objcMembers
class Location: Object {

    dynamic var name = ""
    dynamic var latitude = 0.0
    dynamic var longitude = 0.0

    var location: CLLocation {
        CLLocation(latitude: latitude, longitude: longitude)
    }
    
    convenience init(name: String, latitude: Double, longitude: Double) {
        self.init()
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
