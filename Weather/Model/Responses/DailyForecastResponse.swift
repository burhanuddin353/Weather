//
//  DailyForecastResponse.swift
//  OpenWeather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import Foundation

struct OneCallResponse: OWResponse {

    var cod: Int?
    var errorMessage: String?

    var lat: Double?
    var lon: Double?
    var timezoneOffset: Int?
    var currentForecast: Forcast?
    var hourlyForecast: [Forcast]?
//    var dailyForecast: [DailyForcast]?
}
