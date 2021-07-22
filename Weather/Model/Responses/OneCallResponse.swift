//
//  DailyForecastResponse.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import RealmSwift

@objcMembers
class OneCallResponse: Object, OWResponse {

    dynamic var errorMessage: String? = nil

    dynamic var lat = 0.0
    dynamic var lon = 0.0
    dynamic var currentForecast: Forecast?
    var hourlyForecast = List<Forecast>()
    var dailyForecast = List<DailyForcast>()

    enum CodingKeys: String, CodingKey {
        case errorMessage = "message"
        case lat
        case lon
        case currentForecast = "current"
        case hourlyForecast = "hourly"
        case dailyForecast = "daily"
    }
}
