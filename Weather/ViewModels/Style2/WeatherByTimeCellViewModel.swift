//
//  WeatherByTimeCellModel.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import UIKit

class WeatherByTimeCellViewModel: ViewModel<WeatherByTimeCell, Forecast> {

    override func setup(_ forecast: Forecast?) {
        guard let forecast = forecast else {
            view.timeLabel.text = "--:00"
            view.weatherIconView.image = nil
            view.tempratureLabel.text = "--"
            return
        }

        let date = forecast.date
        let dateComponents = Calendar.current.dateComponents([.hour], from: date)
        if dateComponents.hour == 0 {
            view.timeLabel.text = DateFormatter.shortDate.string(from: date)
        } else {
            view.timeLabel.text = DateFormatter.time.string(from: date)
        }
        if let iconName = forecast.weather.first?.icon {
            view.weatherIconView.image = UIImage(named: iconName)
        }
        // Temp calculation
        let unit = Settings.saved.temperatureUnit
        let temp = CelsiusToFarenheit.getConvertedTemp(from: forecast.temp)
        view.tempratureLabel.text = "\(temp.roundedInt)\(unit.suffix)"
    }
}
