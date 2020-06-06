//
//  SettingsTimerTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsTimerTableViewCell: UITableViewCell {
    private let settingsCtrl = SettingsController()
    
    private lazy var timerSwitch: UISwitch = {
        let timerSwitch = UISwitch()
        timerSwitch.isOn = SettingsController.isTimerSoundActivated
        timerSwitch.thumbTintColor = NRStyle.offWhiteColor
        timerSwitch.onTintColor = NRStyle.interactionColor
        timerSwitch.backgroundColor = NRStyle.secondaryTextColor
        timerSwitch.layer.cornerRadius = 16
        timerSwitch.layer.borderColor = NRStyle.themeColor.cgColor
        timerSwitch.layer.borderWidth = 1
        return timerSwitch
    }()
    
    private lazy var contentLabel: NRLabel = {
        NRLabel(with: "settings.timerSound".localized)
    }()
    
    func setup() {
        self.selectionStyle = .none
        
        contentView.addSubview(contentLabel)
        contentView.addSubview(timerSwitch)
        contentView.backgroundColor = NRStyle.themeColor
        backgroundColor = NRStyle.themeColor
        
        timerSwitch.anchor(top: nil, leading: nil, bottom: nil, trailing: contentView.trailingAnchor, centerY: contentView.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: NRStyle.horizontalPadding))
        
        contentLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: NRStyle.horizontalPadding, bottom: 0, right: 0))
        
        timerSwitch.addTarget(self, action: #selector(changedSwitchValue), for: .valueChanged)
    }

    @objc private func changedSwitchValue(sender: UISwitch) {
        let isOn = sender.isOn
        settingsCtrl.timerSoundStateChanged(to: isOn)
    }
}
