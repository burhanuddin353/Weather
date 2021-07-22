//
//  DailyForecast.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import RealmSwift

@objcMembers
class DailyForcast: Object, Codable {

    dynamic var date = Date()
    dynamic var sunrise: Date = Date()
    dynamic var sunset: Date = Date()
    dynamic var temp: Temperature?
    dynamic var pressure = 0
    dynamic var humidity = 0
    dynamic var dewPoint = 0.0
    dynamic var uvi = 0.0
    dynamic var clouds = 0
    dynamic var windSpeed = 0.0
    var weather = List<Weather>()
    dynamic var pop = 0.0

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case sunrise
        case sunset
        case temp
        case pressure
        case humidity
        case dewPoint
        case uvi
        case clouds
        case windSpeed
        case weather
        case pop
    }
}
