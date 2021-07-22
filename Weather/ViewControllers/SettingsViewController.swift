//
//  SettingsViewController.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import UIKit
import Realm

class SettingsViewController: UITableViewController {

    @IBOutlet private weak var tempUnitSegmentedControl: UISegmentedControl!

    let settings = Settings.saved
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tempUnitSegmentedControl.selectedSegmentIndex = settings.temperatureUnit.rawValue
    }
}

// MARK: - IBActions
extension SettingsViewController {

    @IBAction private func tempUnitChanged(_ segmentedControl: UISegmentedControl) {

        settings.temperatureUnit = TemperatureUnit(rawValue: segmentedControl.selectedSegmentIndex) ?? .celsius
        NotificationCenter.default.post(name: .temperatureUnitChanged, object: nil)
    }
}
