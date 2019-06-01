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
    
    private let tableView: SetsTableView = {
        let tableView = SetsTableView()
        tableView.allowsSelection = false
        tableView.register(HistoryDetailSetsTableViewCell.self, forCellReuseIdentifier: NRConstants.CellIdentifiers.historyDetailSetsTableViewCell)
        return tableView
    }()
    
    var sets: [Set] = []

    convenience init(sets: [Set]) {
        self.init()
        
        self.sets = [Set(reps: 12, weight: 39),
                     Set(reps: 10, weight: 11),
                     Set(reps: 10, weight: 11),
                     Set(reps: 10, weight: 11),
                     Set(reps: 10, weight: 11),Set(reps: 10, weight: 11),
                     Set(reps: 10, weight: 11),
                     Set(reps: 10, weight: 11),
                     Set(reps: 10, weight: 11),
                     Set(reps: 10, weight: 11),
                     Set(reps: 10, weight: 11),
                     Set(reps: 10, weight: 11),
                     Set(reps: 10, weight: 11),
                     Set(reps: 10, weight: 11),
        
        ]
        setupLayout()
        setupTableView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupDesign()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    private func setupDesign() {
        tableView.backgroundColor = .backgroundColorUIControl
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 1))
    }

}

private extension HistoryDetailSetsView {
    
    func setupLayout() {
        addSubviews(setsLabel, tableView)
        
        setsLabel.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, size: CGSize(width: 0, height: 30))
        tableView.anchor(top: setsLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 8, left: 16, bottom: 16, right: 16))
    }
}
