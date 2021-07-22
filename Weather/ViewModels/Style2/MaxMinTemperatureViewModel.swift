//
//  MaxMinTemperatureViewModel.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import Foundation

class MaxMinTemperatureViewModel: ViewModel<MaxMinTemperatureView, Temperature> {

    override func setup(_ temperature: Temperature?) {

        guard let temperature = temperature else {
            view.minTemperatureLabel.text = "--"
            view.maxTemperatureLabel.text = "--"
            return
        }
        
        // Temp calculation
        let tempMin = CelsiusToFarenheit.getConvertedTemp(from: temperature.min)
        let tempMax = CelsiusToFarenheit.getConvertedTemp(from: temperature.max)
        
        view.minTemperatureLabel.text = "\(tempMin.roundedInt)"
        view.maxTemperatureLabel.text = "\(tempMax.roundedInt)"
        view.temperatureUnitLabel.text = Settings.saved.temperatureUnit.suffix
    }
}
