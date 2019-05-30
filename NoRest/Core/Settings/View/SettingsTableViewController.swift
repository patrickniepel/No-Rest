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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupScreen()
    }
    
    private func setupTableView() {
        tableView.register(SettingsUnitTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.settingsUnitTableViewCell)
        tableView.register(SettingsTimerTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.settingsTimerTableViewCell)
        tableView.register(NRDefaultTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.nrDefaultTableViewCell)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupScreen() {
        navigationItem.title = NRConstants.ScreenTitles.settings
        tableView.backgroundColor = .backgroundColorMain
        tableView.rowHeight = NRConstants.TableViews.rowHeight
        tableView.sectionHeaderHeight = NRConstants.TableViews.sectionHeight
        tableView.separatorColor = .uiControl
    }
    
    func showAlertForDataReset(_ dataReset: DataReset) {
        let buttonTitles = [NRConstants.ButtonTitles.cancelButton, NRConstants.ButtonTitles.resetButton]
        let deleteButtonHandler: ((UIAlertAction) -> Void)? = { action in
            SettingsController.resetData(dataReset)
            AlertController.showSuccessAlert()
        }
        showAlert(with: NRConstants.Alerts.alertMessage, message: "", buttonTitles: buttonTitles, buttonStyles: [.cancel, .destructive], buttonHandlers: [nil, deleteButtonHandler])
    }
}
