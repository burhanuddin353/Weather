//
//  ForecastViewControllerSummaryExtension.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import Foundation

extension ForecastViewController: WeatherByDateViewControllerDelegate {

    func weatherByDateViewController(
        _ viewController: WeatherByDateViewController,
        didSelect forecast: DailyForcast
    ) {
        weatherSummaryTableContainerView.isHidden = false
        weatherByDateContainerView.isHidden = true

        weatherSummaryTableViewController?.forecast = forecast
        tableContainerHeightConstraint.constant = weatherSummaryTableViewController?.tableView.contentSize.height ?? 0
    }
}

extension ForecastViewController: WeatherSummaryTableViewControllerDelegate {

    func viewControllerDidClickList(_ viewController: WeatherSummaryTableViewController) {

        weatherSummaryTableContainerView.isHidden = true
        weatherByDateContainerView.isHidden = false

        tableContainerHeightConstraint.constant = weatherSummaryTableViewController?.tableView.contentSize.height ?? 0
    }
}
