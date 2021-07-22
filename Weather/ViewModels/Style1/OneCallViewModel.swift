//
//  ForecastViewModel.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import CoreLocation
import RealmSwift

class OneCallViewModel: NSObject {
    typealias Handler = () -> Void
    
    let locationService = LocationService()
    let areaName = Binder("Loading...")
    let currentForecast: Binder<Forecast?> = Binder(nil)
    let currentWeather: Binder<Weather?> = Binder(nil)
    let currentTemperature = Binder("--")
    let feelsLikeTemp = Binder("--")
    let hourlyForecasts = Binder(List<Forecast>())
    let dailyForecasts = Binder(List<DailyForcast>())

    override init() {
        super.init()
        refreshData()
    }

    func refreshData(handler: Handler? = nil) {

        getCurrentLocation { [weak self] location in
            guard let self = self else { return }
            guard let location = location else {
                handler?()
                return
            }
            self.fetchForecastForLocation(location) {
                handler?()
            }
        }
    }
    
    func getCurrentLocation(handler: @escaping LocationHandler) {
        
        areaName.value = "Loading..."
        let realm = try! Realm()
        let savedLocation = realm.objects(Location.self).first
        locationService.getCurrentLocation { [weak self] location in
            guard let self = self else { return }
            guard let location = location ?? savedLocation else {
                handler(nil)
                self.areaName.value = "Not Found"
                return
            }
            self.areaName.value = location.name
            handler(location)
            
            if savedLocation == nil {
                try! realm.write {
                    realm.deleteAll(Location.self)
                    realm.add(location)
                }
            }
        }
    }

    private func reset() {
        currentForecast.value = nil
        currentWeather.value = nil
        currentTemperature.value = "--"
        feelsLikeTemp.value = "--"
        hourlyForecasts.value = List<Forecast>()
        dailyForecasts.value = List<DailyForcast>()
    }

    private func fetchForecastForLocation(_ location: Location,
                                          handler: Handler? = nil) {

        let endpoint: Endpoint<OneCallResponse> = .oneCall(
            forlat: location.latitude,
            lon: location.longitude
        )

        let realm = try! Realm()
        let savedResponse = realm.objects(OneCallResponse.self).first
        OWService.request(for: endpoint) { [weak self] result in
            guard let self = self else { return }

            switch result {

            case .success(let oneCallResponse):
                self.initializeValues(from: oneCallResponse)
                handler?()

                try! realm.write {
                    realm.deleteAll(OneCallResponse.self)
                    realm.add(oneCallResponse)
                }
            case .failure(let error):
                WarningView.show(
                    withTitle: nil,
                    message: error.localizedDescription
                )
                if let savedResponse = savedResponse {
                    self.initializeValues(from: savedResponse)
                }
                handler?()
            }
        }
    }

    private func initializeValues(from oneCallResponse: OneCallResponse) {

        currentForecast.value = oneCallResponse.currentForecast
        if let currentForecast = oneCallResponse.currentForecast {
            initialize(currentForecast)
        }
        hourlyForecasts.value = oneCallResponse.hourlyForecast
        dailyForecasts.value = oneCallResponse.dailyForecast
    }

    private func initialize(_ currentForecast: Forecast) {

        currentWeather.value = currentForecast.weather.first
        // Temp calculation
        let unit = Settings.saved.temperatureUnit
        let temp = CelsiusToFarenheit.getConvertedTemp(from: currentForecast.temp)
        let feelsLike = CelsiusToFarenheit.getConvertedTemp(from: currentForecast.feelsLike)
        currentTemperature.value = "\(temp.roundedInt)\(unit.suffix)"
        feelsLikeTemp.value = "\(feelsLike.roundedInt)\(unit.suffix)"
    }
}
