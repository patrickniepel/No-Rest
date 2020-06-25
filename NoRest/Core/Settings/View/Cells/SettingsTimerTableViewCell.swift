//
//  SettingsTimerTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsTimerTableViewCell: NRTableViewCell {
    private let settingsCtrl = SettingsController()

    private lazy var timerSwitch: UISwitch = {
        let timerSwitch = UISwitch()
        timerSwitch.isOn = SettingsController.isTimerSoundActivated
        timerSwitch.layer.cornerRadius = 16
        timerSwitch.layer.borderWidth = 1
        timerSwitch.applyShadow()
        return timerSwitch
    }()

    private lazy var contentLabel: UILabel = .init()

    func setup() {
        self.selectionStyle = .none

        contentLabel.text = "settings.timerSound".localized

        contentView.addSubview(contentLabel)
        contentView.addSubview(timerSwitch)

        timerSwitch.anchor(top: nil,
                           leading: nil,
                           bottom: nil,
                           trailing: contentView.trailingAnchor,
                           centerY: contentView.centerYAnchor,
                           padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: NRStyle.horizontalPadding))

        contentLabel.anchor(top: contentView.topAnchor,
                            leading: contentView.leadingAnchor,
                            bottom: contentView.bottomAnchor,
                            trailing: nil,
                            padding: UIEdgeInsets(top: 0, left: NRStyle.horizontalPadding, bottom: 0, right: 0))

        timerSwitch.addTarget(self, action: #selector(changedSwitchValue), for: .valueChanged)
    }

    @objc
    private func changedSwitchValue(sender: UISwitch) {
        let isOn = sender.isOn
        settingsCtrl.timerSoundStateChanged(to: isOn)
    }

    override func apply(theme: TableViewCellTheme) {
        super.apply(theme: theme)

        backgroundColor = theme.backgroundColor
        contentView.backgroundColor = theme.backgroundColor
        contentLabel.textColor = theme.textColor
        contentLabel.font = theme.textFont

        timerSwitch.layer.borderColor = theme.backgroundColor.cgColor
        timerSwitch.backgroundColor = theme.backgroundColor
        timerSwitch.thumbTintColor = theme.offWhiteColor
        timerSwitch.onTintColor = theme.interactionColor
    }
}
