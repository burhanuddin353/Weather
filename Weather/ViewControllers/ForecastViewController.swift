//
//  ViewController.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import UIKit
import CoreLocation
import RealmSwift

class ForecastViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var environmentLabel: UILabel!
    @IBOutlet private weak var areaNameLabel: UILabel!
    @IBOutlet private weak var currentTempratureLabel: UILabel!
    @IBOutlet private weak var feelsLikeTempratureLabel: UILabel!
    @IBOutlet private weak var weatherIconView: WeatherIconView!
    @IBOutlet private weak var weatherSummaryView: WeatherSummaryView!

    @IBOutlet weak var tableContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var weatherByDateContainerView: UIView!
    @IBOutlet weak var weatherSummaryTableContainerView: UIView!

    private var weatherByTimeListViewController: WeatherByTimeListViewController?
    private var weatherByDateViewController: WeatherByDateViewController?
    var weatherSummaryTableViewController: WeatherSummaryTableViewController?

    let oneCallViewModel = OneCallViewModel()
    private let environmentViewModel = EnvironmentViewModel()
    
    private lazy var weatherIconViewModel = WeatherIconViewModel(weatherIconView)
    private lazy var weatherSummaryViewModel = WeatherSummaryViewModel(weatherSummaryView)

    let backgroundFetchInterval = 10.0
    let lastFetchedDate = Date()
    
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        manager.allowsBackgroundLocationUpdates = true
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)

        setupBinders()
        
        locationManager.startUpdatingLocation()
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshData), name: .temperatureUnitChanged, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    @objc
    func refreshData() {
        scrollView.refreshControl?.beginRefreshing()
        oneCallViewModel.refreshData { [weak self] in
            guard let self = self else { return }
            self.scrollView.refreshControl?.endRefreshing()
        }
    }
    
    private func setupBinders() {

        environmentViewModel.environment.bind { [weak self] in
            guard let self = self else { return }
            self.environmentLabel.text = $0
        }
        
        oneCallViewModel.areaName.bind { [weak self] in
            guard let self = self else { return }
            self.areaNameLabel.text = $0
        }

        oneCallViewModel.currentWeather.bind { [weak self] in
            guard let self = self else { return }
            self.weatherIconViewModel.model = $0
        }

        oneCallViewModel.currentTemperature.bind { [weak self] in
            guard let self = self else { return }
            self.currentTempratureLabel.text = $0
        }

        oneCallViewModel.feelsLikeTemp.bind { [weak self] in
            guard let self = self else { return }
            self.feelsLikeTempratureLabel.text = $0
        }

        oneCallViewModel.currentForecast.bind { [weak self] in
            guard let self = self else { return }
            self.weatherSummaryViewModel.model = $0
        }

        oneCallViewModel.hourlyForecasts.bind { [weak self] in
            guard let self = self else { return }
            self.weatherByTimeListViewController?.forecasts = $0
        }

        oneCallViewModel.dailyForecasts.bind { [weak self] in
            guard let self = self else { return }
            self.weatherByDateViewController?.forecasts = $0
            self.tableContainerHeightConstraint.constant = self.weatherByDateViewController?.tableView.contentSize.height ?? 0
        }
    }
}

// MARK: - Navigation
extension ForecastViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch segue.identifier {
        case "embedWeatherByTimeSegue":
            weatherByTimeListViewController = segue.destination as? WeatherByTimeListViewController

        case "embedWeatherByWeekdaySegue":
            weatherByDateViewController = segue.destination as? WeatherByDateViewController
            weatherByDateViewController?.delegate = self

        case "embedWeatherSummarTable":
            weatherSummaryTableViewController = segue.destination as? WeatherSummaryTableViewController
            weatherSummaryTableViewController?.delegate = self

        default: break
        }
    }
}
