//
//  ForecastViewControllerNotificationExtension.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 22/07/21.
//

import UIKit
import CoreLocation

// MARK:- CLLocationManagerDelegate
extension ForecastViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        refreshData()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard Date().timeIntervalSince(lastFetchedDate) > backgroundFetchInterval
        else { return }
        
        UNNotificationRequest
            .request(
                for: "Weather Alert",
                message: """
                The current temperature is \(oneCallViewModel.currentTemperature.value) and \(oneCallViewModel.currentWeather.value?.shortDescription ?? "")
                """)
            .notify()
    }
}
