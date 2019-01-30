//
//  SettingsTableViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    private var delegate: SettingsTableViewDelegate?
    private var dataSource: SettingsTableViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
        delegate = SettingsTableViewDelegate()
        dataSource = SettingsTableViewDataSource()
        
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
        setupDesign()
    }
    
    private func registerCells() {
        tableView.register(SettingsUnitTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.settingsUnitTableViewCell)
        tableView.register(SettingsTimerTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.settingsTimerTableViewCell)
        tableView.register(SettingsYourDataTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.settingsYourDataTableViewCell)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.settingsDefaultTableViewCell)
    }
    
    private func setupDesign() {
        tableView.setupDefaultBackgroundColor()
    }
}
