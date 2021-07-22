//
//  ExchangeRate.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import RealmSwift

@objcMembers
class Forecast: Object, Codable {

    dynamic var date = Date()
    dynamic var sunrise: Date? = nil
    dynamic var sunset: Date? = nil
    dynamic var temp = 0.0
    dynamic var feelsLike = 0.0
    dynamic var pressure = 0
    dynamic var humidity = 0
    dynamic var dewPoint = 0.0
    dynamic var uvi = 0.0
    dynamic var clouds = 0
    dynamic var visibility = 0
    dynamic var windSpeed = 0.0
    var weather = List<Weather>()

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case sunrise
        case sunset
        case temp
        case feelsLike
        case pressure
        case humidity
        case dewPoint
        case uvi
        case clouds
        case visibility
        case windSpeed
        case weather
    }
}
