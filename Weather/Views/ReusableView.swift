//
//  MaxMinTemperatureView.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import UIKit

class ReusableView: UIView {

    @IBOutlet private weak var contentView: UIView!
    var nibName: String?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {

        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)

        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
}
