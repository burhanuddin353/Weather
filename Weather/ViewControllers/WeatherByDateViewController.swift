//
//  WeatherByWeekdayViewController.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 01/05/21.
//

import UIKit
import RealmSwift

protocol WeatherByDateViewControllerDelegate: class {

    func weatherByDateViewController(
        _ viewController: WeatherByDateViewController,
        didSelect forecast: DailyForcast
    )
}

private let weatherByDateCellIdentifier = "WeatherByDateCell"
class WeatherByDateViewController: UITableViewController {

    var forecasts = List<DailyForcast>() {
        didSet {
            tableView.reloadData()
        }
    }

    var oneCallViewModel: OneCallViewModel?
    var viewModels = [WeatherByDateCellViewModel]()
    
    weak var delegate: WeatherByDateViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oneCallViewModel?.dailyForecasts.bind { [weak self] in
            guard let self = self else { return }
            self.forecasts = $0
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        forecasts.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        tableView.dequeueReusableCell(
            withIdentifier: weatherByDateCellIdentifier,
            for: indexPath
        ) as? WeatherByDateCell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView,
                            willDisplay cell: UITableViewCell,
                            forRowAt indexPath: IndexPath) {
        guard let cell = cell as? WeatherByDateCell else { return }

        let forecast = forecasts[indexPath.row]
        if let viewModel = viewModels.first(where: { $0.view == cell}) {
            viewModel.model = forecast
        } else {
            viewModels.append(WeatherByDateCellViewModel(cell, model: forecast))
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.weatherByDateViewController(
            self,
            didSelect: forecasts[indexPath.row]
        )
    }
}
