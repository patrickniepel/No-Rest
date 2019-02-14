//
//  SettingsTableViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit
import SCLAlertView

class SettingsTableViewController: UITableViewController {
    
    private var delegate: SettingsTableViewDelegate?
    private var dataSource: SettingsTableViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.subscribe(self) {
            $0.select {
                $0.settingsState
            }
        }
        
        registerCells()
        
        delegate = SettingsTableViewDelegate()
        dataSource = SettingsTableViewDataSource()
        
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
        setupScreen()
    }
    
    private func registerCells() {
        tableView.register(SettingsUnitTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.settingsUnitTableViewCell)
        tableView.register(SettingsTimerTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.settingsTimerTableViewCell)
        tableView.register(SettingsYourDataTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.settingsYourDataTableViewCell)
        tableView.register(NRDefaultTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.settingsDefaultTableViewCell)
    }
    
    private func setupScreen() {
        navigationItem.title = NRConstants.ScreenTitles.settings
        tableView.setupDefaultBackgroundColor()
        tableView.rowHeight = 65
        tableView.contentInset = UIEdgeInsets(top: .defaultPadding, left: 0, bottom: 0, right: 0)
    }
    
    func showAlertForDataReset(_ dataReset: DataReset) {
        let alert = UIAlertController(title: NRConstants.Alerts.alertMessage, message: nil, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: NRConstants.Settings.cancelButton, style: .cancel, handler: nil)
        let deleteButton = UIAlertAction(title: NRConstants.Settings.resetButton, style: .destructive) { action in
            SettingsController.resetData(dataReset)
            AlertController.showSuccessAlert()
        }
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        present(alert, animated: true)
    }
    
    deinit {
        store.unsubscribe(self)
    }
}
