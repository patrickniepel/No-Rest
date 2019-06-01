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
    
    private func setupTitle() {
        navigationItem.title = NRConstants.ScreenTitles.history
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .backgroundColorMain
        tableView.allowsSelection = false
        tableView.allowsMultipleSelection = false
        tableView.tableFooterView = UIView()
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.historyTableViewCell)
    }
}
