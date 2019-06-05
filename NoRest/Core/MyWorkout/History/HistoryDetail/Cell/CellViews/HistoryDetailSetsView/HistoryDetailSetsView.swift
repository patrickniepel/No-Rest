//
//  HistoryDetailSetsView.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class HistoryDetailSetsView: UIView {
    
    private let setsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 15)
        label.textAlignment = .center
        label.text = NRConstants.Texts.sets
        return label
    }()
    
    private lazy var tableView: NRSetsTableView = {
        let tableView = NRSetsTableView()
        
        tableView.allowsSelection = false
        tableView.register(NRSetsTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.nrSetsTableViewCell)
        tableView.setupDesign()
        return tableView
    }()
    var sets: [Set] = []

    convenience init(sets: [Set]) {
        self.init()
        
        self.sets = sets
        setupLayout()
        setupTableView()
        checkSets()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .backgroundColorUIControl
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 1))
    }
    
    private func checkSets() {
        if sets.count == 0 {
            setsLabel.text = NRConstants.Texts.noSets
            tableView.removeFromSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.maxHeight = self.bounds.height * 0.9
        layoutIfNeeded()
    }
}

private extension HistoryDetailSetsView {
    
    func setupLayout() {
        addSubviews(setsLabel, tableView)

        setsLabel.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, size: CGSize(width: 0, height: 30))
        tableView.anchor(top: setsLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 8, bottom: 16, right: 8))
    }
}
