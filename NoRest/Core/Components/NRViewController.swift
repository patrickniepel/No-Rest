//
//  NRViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRViewController: UIViewController {
    var viewControllerTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let navigationBar = self.navigationController?.navigationBar {
            let titleLabel = NRLabel(with: viewControllerTitle, size: NRStyle.fontSizeViewControllerTitle)
            navigationBar.addSubview(titleLabel)
            titleLabel.anchor(leading: navigationBar.leadingAnchor, centerY: navigationBar.centerYAnchor, padding: .init(top: 0, left: NRStyle.horizontalPadding, bottom: 0, right: 0))
        }
        
        view.backgroundColor = NRStyle.themeColor
        navigationItem.title = ""
    }
}
