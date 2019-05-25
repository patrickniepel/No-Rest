//
//  HistoryTableViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 28.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    private var dataSource: HistoryTableViewDataSource?
    private var delegate: HistoryTableViewDelegate?
    private var historyCtrl = HistoryController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = HistoryTableViewDataSource(historyCtrl: historyCtrl)
        delegate = HistoryTableViewDelegate()
        
        tableView.dataSource = dataSource
        tableView.delegate = delegate

        setupTitle()
        setupTableView()
    }
    
    private func setupTitle() {
        navigationItem.title = NRConstants.ScreenTitles.history
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .backgroundColorMain
        tableView.allowsSelection = false
        tableView.allowsMultipleSelection = false
        tableView.sectionHeaderHeight = NRConstants.TableViews.sectionHeight
        tableView.rowHeight = NRConstants.TableViews.rowHeight * 2
        tableView.tableFooterView = UIView()
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.historyTableViewCell)
    }
}
