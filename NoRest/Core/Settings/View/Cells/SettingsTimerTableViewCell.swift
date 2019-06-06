//
//  SettingsTimerTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsTimerTableViewCell: UITableViewCell {
    
    private let timerSwitch: UISwitch = {
        let timerSwitch = UISwitch()
        timerSwitch.isOn = SettingsController.isTimerSoundActivated
        timerSwitch.tintColor = .backgroundColorMain
        timerSwitch.thumbTintColor = .uiControl
        timerSwitch.onTintColor = .backgroundColorMain
        return timerSwitch
    }()
    
    private let contentLabel: NRLabel = {
        let label = NRLabel(with: NRConstants.Settings.RowTitles.timer)
        return label
    }()
    
    func setup() {
        self.selectionStyle = .none
        
        contentView.addSubview(contentLabel)
        contentView.addSubview(timerSwitch)
        contentView.backgroundColor = .backgroundColorUIControl
        backgroundColor = .backgroundColorUIControl
        
        timerSwitch.anchor(top: nil, leading: nil, bottom: nil, trailing: contentView.trailingAnchor, centerY: contentView.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .defaultPadding))
        
        contentLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: .leadingPaddingCell, bottom: 0, right: 0))
        
        timerSwitch.addTarget(self, action: #selector(changedSwitchValue), for: .valueChanged)
    }

    @objc private func changedSwitchValue(sender: UISwitch) {
        let isOn = sender.isOn
        SettingsController.timerSoundStateChanged(to: isOn)
    }
}
