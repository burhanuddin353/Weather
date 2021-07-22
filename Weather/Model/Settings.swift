//
//  Units.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import RealmSwift

@objcMembers
class Settings: Object {

    static var saved: Settings {
        let realm = try! Realm()
        guard let settings = realm.objects(Settings.self).first else {
            
            let settings = Settings()
            try! realm.write {
                realm.add(settings)
            }
            return settings
        }
        return settings
    }

    @objc private dynamic var _temperatureUnit = 0
    
    var temperatureUnit: TemperatureUnit {
        get {
            TemperatureUnit(rawValue: _temperatureUnit) ?? .celsius
        }
        set {
            let realm = try! Realm()
            try! realm.write {
                _temperatureUnit = newValue.rawValue
            }
        }
    }
}
