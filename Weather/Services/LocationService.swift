//
//  LocationService.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import CoreLocation

typealias LocationHandler = (Location?) -> Void
class LocationService {
    
    lazy var locationManager = CLLocationManager()
    
    func getCurrentLocation(handler: @escaping LocationHandler) {
        
        locationManager.requestWhenInUseAuthorization()
        let authStatuses: [CLAuthorizationStatus] = [
            .authorizedAlways,
            .authorizedWhenInUse
        ]
        guard authStatuses.contains(
                CLLocationManager.authorizationStatus()),
              let location = locationManager.location
        else {
            handler(nil)
            return
        }

        getLocation(for: location) { location in
            handler(location)
        }
    }
    
    func getLocation(for location: CLLocation, handler: @escaping LocationHandler) {
        
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, _ in
            guard let placemark = placemarks?.first,
                  let area = placemark.locality ?? placemark.country,
                  let coordinate = placemark.location?.coordinate
            else {
                handler(nil)
                return
            }

            let location = Location(
                name: area,
                latitude: coordinate.latitude,
                longitude: coordinate.longitude
            )
            handler(location)
        }
    }
}
