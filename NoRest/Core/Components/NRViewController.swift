//
//  NRViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRViewController: UIViewController, Themeable {
    typealias Theme = ViewControllerTheme

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = viewControllerTitle
        return label
    }()

    var viewControllerTitle: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.observe(theme: \ApplicationTheme.native.viewControllerTheme)

        if let navigationBar = self.navigationController?.navigationBar {
            titleLabel.text = viewControllerTitle

            guard titleLabel.superview == nil else { return }

            navigationBar.addSubview(titleLabel)
            titleLabel.anchor(leading: navigationBar.leadingAnchor,
                              centerY: navigationBar.centerYAnchor,
                              padding: .init(top: 0, left: NRStyle.horizontalPadding, bottom: 0, right: 0))
        }
        navigationItem.title = ""
    }

    func apply(theme: Theme) {
        view.backgroundColor = theme.backgroundColor

        titleLabel.font = theme.titleFont
        titleLabel.textColor = theme.titleColor
    }
}
