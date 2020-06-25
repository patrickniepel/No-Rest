//
//  NRTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRTableViewCell: UITableViewCell, Themeable {
    typealias Theme = TableViewCellTheme

    private lazy var disclosureIndicatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.observe(theme: \ApplicationTheme.native.tableViewCellTheme)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addCustomDisclosureIndicator() {
        self.accessoryType = .none

        addSubview(disclosureIndicatorImageView)
        disclosureIndicatorImageView.anchor(trailing: trailingAnchor,
                         centerY: centerYAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: NRStyle.horizontalPadding),
                         size: .init(width: 15, height: 15))
    }

    func apply(theme: Theme) {
        backgroundColor = theme.backgroundColor
        disclosureIndicatorImageView.image = theme.disclosureIndicatorIcon
    }
}
