//
//  WeatherByDateCellViewModel.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import UIKit

class WeatherByDateCellViewModel: ViewModel<WeatherByDateCell, DailyForcast> {

    private var maxMinTempViewModel: MaxMinTemperatureViewModel?

    override func setup(_ forecast: DailyForcast?) {
        guard let forecast = forecast else {
            view.dateLabel.text = ""
            view.weatherIconView.image = nil
            return
        }

        view.dateLabel.text = DateFormatter.day.string(from: forecast.date)
        if let iconName = forecast.weather.first?.icon {
            view.weatherIconView.image = UIImage(named: iconName)
        }
        maxMinTempViewModel = MaxMinTemperatureViewModel(
            view.maxMinTempratureView,
            model: forecast.temp
        )
    }
}
