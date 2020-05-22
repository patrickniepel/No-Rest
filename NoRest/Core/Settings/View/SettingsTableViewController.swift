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
        tableView.backgroundColor = NRStyle.themeColor
        tableView.rowHeight = NRConstants.TableViews.rowHeight
        tableView.sectionHeaderHeight = NRConstants.TableViews.sectionHeight
        tableView.separatorColor = NRStyle.complementaryColor
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func showAlertForDataReset(_ dataReset: DataReset) {
        let appearance = AlertController.interactiveAlertAppearance()
        
        let alertView = SCLAlertView(appearance: appearance)
        let responder = SCLAlertViewResponder(alertview: alertView)
        
        let title: String
        if dataReset == .statistics {
            title = NRConstants.Alerts.resetStatistics
        } else if dataReset == .workoutHistory {
            title = NRConstants.Alerts.resetHistory
        } else {
            title = NRConstants.Alerts.onboarding
        }
        
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
