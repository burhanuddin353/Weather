//
//  WeatherSummaryTableViewModel.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import Foundation

class WeatherSummaryTableViewModel {

    let date = Binder("--")
    let wind = Binder("--")
    let pressure = Binder("--")
    let humidity = Binder("--")
    let visibility = Binder("--")
    let uvi = Binder("--")
    let dewPoint = Binder("--")
    let pop = Binder("--")
    let sunrise = Binder("--:--")
    let sunset = Binder("--:--")
    let temperature: Binder<Temperature?> = Binder(nil)
    let weather: Binder<Weather?> = Binder(nil)

    var forecast: DailyForcast? {
        didSet {
            guard let forecast = forecast else {

                weather.value = nil
                temperature.value = nil
                date.value = ""
                wind.value = "--"
                humidity.value = "--"
                uvi.value = "--"
                pressure.value = "--"
                visibility.value = "--"
                dewPoint.value = "--"
                pop.value = "--"
                sunrise.value = "--:--"
                sunset.value = "--:--"
                return
            }

            weather.value = forecast.weather.first
            temperature.value = forecast.temp
            date.value = DateFormatter.day.string(from: forecast.date)
            wind.value = String(format: "%0.1fm/s WNW",
                                forecast.windSpeed)
            humidity.value = "\(forecast.humidity)%"
            uvi.value = String(format: "%0.1f",
                               forecast.uvi)
            pressure.value = "\(forecast.pressure)hPa"
            visibility.value = String(format: "%0.1km",
                                      forecast.uvi)
            dewPoint.value = "\(forecast.dewPoint.roundedInt)ºC"
            pop.value = "\(forecast.pop.roundedInt)%"

            sunrise.value = DateFormatter.time.string(from: forecast.sunrise)
            sunset.value = DateFormatter.time.string(from: forecast.sunset)
        }
    }
}
