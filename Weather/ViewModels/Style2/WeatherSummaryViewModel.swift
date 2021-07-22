//
//  WeatherSummaryViewModel.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import UIKit

class WeatherSummaryViewModel: ViewModel<WeatherSummaryView, Forecast> {

    override func setup(_ forecast: Forecast?) {
        guard let forecast = forecast else {
            view.windSpeedLabel.text = "--"
            view.uvIndexLabel.text = "--"
            view.pressureLabel.text = "--"
            view.visibilityLabel.text = "--"
            view.dewPointLabel.text = "--"
            return
        }
        view.windSpeedLabel.text = String(format: "%0.1fm/s WNW",
                                          forecast.windSpeed)
        view.humidiyLabel.text = "\(forecast.humidity)%"
        view.uvIndexLabel.text = String(format: "%0.1f",
                                        forecast.uvi)
        view.pressureLabel.text = "\(forecast.pressure)hPa"
        view.visibilityLabel.text = String(format: "%0.1km",
                                           forecast.uvi)
        view.dewPointLabel.text = "\(forecast.dewPoint.roundedInt)ºC"
    }
}
