//
//  ViewModel.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import UIKit

class ViewModel<V: UIView, M: Codable> {

    var view: V
    var model: M? {
        didSet {
            setup(model)
        }
    }

    init(_ view: V, model: M? = nil) {
        self.view = view
        self.model = model
        setup(model)
    }

    func setup(_ model: M?) {}
}
