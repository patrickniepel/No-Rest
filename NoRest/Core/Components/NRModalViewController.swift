//
//  NRModalViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRModalViewController: UIViewController, Themeable {
    typealias Theme = ViewControllerTheme

    lazy var titleLabel: UILabel = .init()

    var onDismiss: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.observe(theme: \ApplicationTheme.native.viewControllerTheme)

        setupNavigationBar()
    }

    private func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "button.title.close".localized,
                                                             style: .plain,
                                                             target: self,
                                                             action: #selector(closeButtonPressed))
    }

    @objc
    func closeButtonPressed() {
        onDismiss?()
    }

    func apply(theme: Theme) {
        view.backgroundColor = theme.backgroundColor

        titleLabel.font = theme.titleFont
        titleLabel.textColor = theme.titleColor
    }
}
