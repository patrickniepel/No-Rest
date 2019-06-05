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
        let appearance = AlertController.interactiveAlertAppearance()
        
        let alertView = SCLAlertView(appearance: appearance)
        let responder = SCLAlertViewResponder(alertview: alertView)
        let title = dataReset == .statistics ? NRConstants.Alerts.resetStatistics : NRConstants.Alerts.resetHistory
        
        alertView.addButton(NRConstants.ButtonTitles.reset) {
            SettingsController.resetData(dataReset)
            AlertController.showSuccessAlert(with: NRConstants.Alerts.successful)
        }
        alertView.addButton(NRConstants.ButtonTitles.cancel) {
            responder.close()
        }
        alertView.showWarning(title, subTitle: NRConstants.Alerts.alertMessage, animationStyle: .bottomToTop)
    }
}
