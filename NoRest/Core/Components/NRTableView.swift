//
//  NRTableView.swift
//  NoRest
//
//  Created by Patrick Niepel on 29.03.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRTableView: UITableView, Themeable {
    typealias Theme = TableViewTheme

    override init(frame: CGRect = CGRect(), style: UITableView.Style = .plain) {
        super.init(frame: frame, style: style)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.observe(theme: \ApplicationTheme.native.tableViewTheme)

        separatorInset = UIEdgeInsets(top: 0, left: NRStyle.horizontalPadding, bottom: 0, right: NRStyle.horizontalPadding)
        separatorColor = NRStyle.secondaryTextColor
        backgroundColor = NRStyle.themeColor
    }

    func apply(theme: Theme) {
        tintColor = theme.tintColor
        separatorColor = theme.separatorColor
        backgroundColor = theme.backgroundColor
    }
}
