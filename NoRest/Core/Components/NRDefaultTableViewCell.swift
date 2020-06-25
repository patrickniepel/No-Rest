//
//  NRDefaultTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 04.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

/** Cell with only a label and accessory type */
class NRDefaultTableViewCell: NRTableViewCell {
    private lazy var contentLabel: UILabel = .init()

    override func prepareForReuse() {
        super.prepareForReuse()
        contentLabel.text = nil
    }

    func setup(title: String, accessoryType: AccessoryType = .none) {
        self.accessoryType = accessoryType

        contentLabel.text = title
        contentView.addSubview(contentLabel)
        contentLabel.fillSuperview(padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))

        // Use custom disclosureIndicator
        if accessoryType == .disclosureIndicator {
            addCustomDisclosureIndicator()
        }
    }

    override func apply(theme: TableViewCellTheme) {
        super.apply(theme: theme)

        contentLabel.textColor = theme.textColor
        contentLabel.font = theme.textFont
    }
}
