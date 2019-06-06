//
//  HistoryTableViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 28.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    var historyCtrl = HistoryController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyCtrl.determineDifferentWorkouts()
        tableView.reloadData()
        checkForEmptyHistory()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkOnboarding()
    }
    
    private func setupTitle() {
        navigationItem.title = NRConstants.ScreenTitles.history
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .backgroundColorMain
        tableView.allowsSelection = false
        tableView.allowsMultipleSelection = false
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 1))
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.historyTableViewCell)
    }
    
    private func checkForEmptyHistory() {
        if !historyCtrl.isHistoryAvailable() {
            tableView.backgroundView = NREmptyView(text: NRConstants.Texts.emptyHistory)
            tableView.isUserInteractionEnabled = false
        } else {
            tableView.backgroundView = nil
            tableView.isUserInteractionEnabled = true
        }
    }
    
    private func checkOnboarding() {
        if historyCtrl.isHistoryAvailable() && !PersistencyController.didShowOnboarding(type: .history) {
            AlertController.showOnboardingAlert(with: NRConstants.Alerts.historyInfo, onboardingType: .history)
        }
    }
}
