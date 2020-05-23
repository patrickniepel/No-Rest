//
//  NRModalViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRModalViewController: UIViewController {
    lazy var titleLabel: NRLabel = NRLabel(with: "", size: NRStyle.fontSizeViewControllerTitle)

    var onDismiss: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

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
}
