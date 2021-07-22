//
//  WeatherSummaryTableViewController.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import UIKit

protocol WeatherSummaryTableViewControllerDelegate: class {
    func viewControllerDidClickList(_ viewController: WeatherSummaryTableViewController)
}

class WeatherSummaryTableViewController: UITableViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var popLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var uviLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var weatherIconView: WeatherIconView!
    @IBOutlet weak var maxMinTemperatureView: MaxMinTemperatureView!

    private let viewModel = WeatherSummaryTableViewModel()
    private lazy var weatherIconViewModel = WeatherIconViewModel(weatherIconView)
    private lazy var maxMinTemperatureViewModel = MaxMinTemperatureViewModel(maxMinTemperatureView)

    weak var delegate: WeatherSummaryTableViewControllerDelegate?

    var forecast: DailyForcast? {
        didSet {
            viewModel.forecast = forecast
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.weather.bind { [weak self] in
            guard let self = self else { return }
            self.weatherIconViewModel.model = $0
        }

        viewModel.temperature.bind { [weak self] in
            guard let self = self else { return }
            self.maxMinTemperatureViewModel.model = $0
        }

        viewModel.date.bind { [weak self] in
            guard let self = self else { return }
            self.dateLabel.text = $0
        }

        viewModel.wind.bind { [weak self] in
            guard let self = self else { return }
            self.windSpeedLabel.text = $0
        }

        viewModel.pop.bind { [weak self] in
            guard let self = self else { return }
            self.popLabel.text = $0
        }

        viewModel.humidity.bind { [weak self] in
            guard let self = self else { return }
            self.humidityLabel.text = $0
        }

        viewModel.pressure.bind { [weak self] in
            guard let self = self else { return }
            self.pressureLabel.text = $0
        }

        viewModel.uvi.bind { [weak self] in
            guard let self = self else { return }
            self.uviLabel.text = $0
        }

        viewModel.sunrise.bind { [weak self] in
            guard let self = self else { return }
            self.sunriseLabel.text = $0
        }

        viewModel.sunset.bind { [weak self] in
            guard let self = self else { return }
            self.sunsetLabel.text = $0
        }
    }
}

// MARK: - IBActions
extension WeatherSummaryTableViewController {

    @IBAction private func listClicked(_ button: UIButton) {
        delegate?.viewControllerDidClickList(self)
    }
}
