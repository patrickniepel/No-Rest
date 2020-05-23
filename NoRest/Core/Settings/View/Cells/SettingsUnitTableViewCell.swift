//
//  SettingsUnitTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsUnitTableViewCell: UITableViewCell {
    private let settingsCtrl = SettingsController()
    
    private lazy var unitSegmentedControl: UISegmentedControl = {
        let items: [String] = [Unit.kg.rawValue, Unit.lbs.rawValue]
        let control = UISegmentedControl(items: items)

        control.backgroundColor = NRStyle.themeColor
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: NRStyle.themeColor], for: .selected)
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: NRStyle.primaryTextColor], for: .normal)
        
        let segmentWidth = self.contentView.frame.width * 0.75 / 2
        for i in 0..<items.count {
            control.setWidth(segmentWidth, forSegmentAt: i)
        }
        
        control.selectedSegmentIndex = SettingsController.currentUnitAsIndex
        control.addTarget(self, action: #selector(unitChanged), for: .valueChanged)
        return control
    }()
    
    private lazy var contentLabel: NRLabel = {
        NRLabel(with: "settings.unit".localized)
    }()

    func setup() {
        self.selectionStyle = .none
        
        contentView.addSubview(contentLabel)
        contentView.addSubview(unitSegmentedControl)
        contentView.backgroundColor = NRStyle.themeColor
        backgroundColor = NRStyle.themeColor
        
        unitSegmentedControl.anchor(top: nil, leading: nil, bottom: nil, trailing: contentView.trailingAnchor, centerY: contentView.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: NRStyle.horizontalPadding))
        
        contentLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: NRStyle.horizontalPadding, bottom: 0, right: 0))
    }
    
    @objc private func unitChanged(sender: UISegmentedControl) {
        settingsCtrl.unitChanged(to: sender.selectedSegmentIndex)
    }
}
