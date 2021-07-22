//
//  MaxMinTemperatureView.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 20/07/21.
//

import UIKit

let animationDuration = 0.25

class WarningView: ReusableView {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!

    var title: String? {
        didSet {
            titleLabel.text = title
            titleLabel.isHidden = title == nil
        }
    }

    var message: String? {
        didSet {
            messageLabel.text = message
            messageLabel.isHidden = message == nil
        }
    }

    static func show(withTitle title: String?, message: String?) {

        let window = UIApplication.shared.delegate?.window
        let statusBarHeight = window??.safeAreaInsets.top ?? 0
        let size = CGSize(width: UIScreen.main.bounds.width, height: statusBarHeight + 48)
        let frame = CGRect(origin: CGPoint(x: 0, y: -size.height), size: size)
        let view = WarningView(frame: frame)
        view.title = title
        view.message = message

        window??.addSubview(view)
        UIView.animate(withDuration: animationDuration, animations: {
            view.frame = view.frame.offsetBy(dx: 0, dy: view.bounds.height)
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                UIView.animate(withDuration: animationDuration, animations: {
                    view.frame = view.frame.offsetBy(dx: 0, dy: -view.bounds.height)
                }) { _ in
                    view.removeFromSuperview()
                }
            }
        }
    }

    @IBAction private func tapped(_ gestureRecognizer: UIGestureRecognizer) {

        UIView.animate(withDuration: 0.25, animations: {
            self.frame = self.frame.offsetBy(dx: 0, dy: -self.bounds.height)
        }) { _ in
            self.removeFromSuperview()
        }
    }
}
