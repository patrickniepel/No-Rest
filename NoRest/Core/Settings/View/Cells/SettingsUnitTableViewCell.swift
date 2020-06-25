//
//  SettingsUnitTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class SettingsUnitTableViewCell: NRTableViewCell {
    private let settingsCtrl = SettingsController()

    private lazy var unitSegmentedControl: UISegmentedControl = {
        let items: [String] = [Unit.kg.rawValue, Unit.lbs.rawValue]
        let control = UISegmentedControl(items: items)

        let segmentWidth = self.contentView.frame.width * 0.6 / 2
        for i in 0..<items.count {
            control.setWidth(segmentWidth, forSegmentAt: i)
        }

        control.selectedSegmentIndex = SettingsController.currentUnitAsIndex
        control.addTarget(self, action: #selector(unitChanged), for: .valueChanged)
        control.applyShadow()
        return control
    }()

    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "settings.unit".localized
        return label
    }()

    func setup() {
        self.selectionStyle = .none

        contentView.addSubview(contentLabel)
        contentView.addSubview(unitSegmentedControl)

        contentLabel.anchor(top: contentView.topAnchor,
                            leading: contentView.leadingAnchor,
                            bottom: contentView.bottomAnchor,
                            trailing: nil,
                            padding: UIEdgeInsets(top: 0, left: NRStyle.horizontalPadding, bottom: 0, right: 0))

        unitSegmentedControl.anchor(top: nil,
                                    leading: nil,
                                    bottom: nil,
                                    trailing: contentView.trailingAnchor,
                                    centerY: contentView.centerYAnchor,
                                    padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: NRStyle.horizontalPadding))
    }

    @objc private
    func unitChanged(sender: UISegmentedControl) {
        settingsCtrl.unitChanged(to: sender.selectedSegmentIndex)
    }

    override func apply(theme: TableViewCellTheme) {
        super.apply(theme: theme)

        backgroundColor = theme.backgroundColor
        contentView.backgroundColor = theme.backgroundColor
        contentLabel.textColor = theme.textColor
        contentLabel.font = theme.textFont

        unitSegmentedControl.backgroundColor = theme.backgroundColor
        unitSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: theme.backgroundColor], for: .selected)
        unitSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: theme.textColor], for: .normal)
    }
}
