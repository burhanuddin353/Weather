//
//  WeatherByTimeListViewController.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "WeatherByTimeCell"

class WeatherByTimeListViewController: UICollectionViewController {

    var forecasts = List<Forecast>() {
        didSet {
            collectionView.reloadData()
        }
    }

    var viewModels = [WeatherByTimeCellViewModel]()

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        forecasts.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView
            .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        as? WeatherByTimeCell ?? UICollectionViewCell()
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 willDisplay cell: UICollectionViewCell,
                                 forItemAt indexPath: IndexPath) {
        guard let cell = cell as? WeatherByTimeCell else { return }

        let forecast = forecasts[indexPath.row]
        if let viewModel = viewModels.first(where: { $0.view == cell}) {
            viewModel.model = forecast
        } else {
            viewModels.append(WeatherByTimeCellViewModel(cell, model: forecast)) 
        }
    }
}
