//
//  SettingsTimerTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsTimerTableViewCell: UITableViewCell {
    
    let timerSwitch: UISwitch = {
        let timerSwitch = UISwitch()
        timerSwitch.isOn = SettingsController.isTimerSoundActivated
        timerSwitch.tintColor = .mainColorLight
        timerSwitch.thumbTintColor = .mainColor
        timerSwitch.onTintColor = .mainColorLight
        timerSwitch.addTarget(self, action: #selector(changedSwitchValue), for: .valueChanged)
        return timerSwitch
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup() {
        self.selectionStyle = .none
        textLabel?.text = NRConstants.Settings.RowTitles.timer
        setupTimerSwitch()
    }
    
    private func setupTimerSwitch() {
        contentView.addSubview(timerSwitch)
        timerSwitch.anchor(top: nil, leading: nil, bottom: nil, trailing: contentView.trailingAnchor, centerY: true, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: NRConstants.Insets.default))
    }
    
    @objc private func changedSwitchValue(sender: UISwitch) {
        let isOn = sender.isOn
        SettingsController.timerSoundStateChanged(to: isOn)
    }

}
