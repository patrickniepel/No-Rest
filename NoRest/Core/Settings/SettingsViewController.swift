//
//  SettingsViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsViewController: NRViewController {
    private lazy var settingsView: SettingsView = .init()
    
    override func viewDidLoad() {
        viewControllerTitle = "settings.title".localized
        
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(settingsView)
        settingsView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
}
