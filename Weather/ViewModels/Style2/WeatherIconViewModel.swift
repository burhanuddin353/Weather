//
//  WeatherIconViewModel.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import UIKit

class WeatherIconViewModel: ViewModel<WeatherIconView, Weather> {

    override func setup(_ weather: Weather?) {
        guard let weather = weather else {
            view.iconView.image = nil
            view.descriptionLabel.text = "--"
            return
        }

        view.iconView.image = UIImage(named: weather.icon)
        view.descriptionLabel.text = weather.shortDescription
    }
}
