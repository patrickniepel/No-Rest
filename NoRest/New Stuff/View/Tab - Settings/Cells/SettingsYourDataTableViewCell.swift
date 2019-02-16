//
//  SettingsYourDataTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsYourDataTableViewCell: UITableViewCell {
    
    private lazy var resetButton: NRButton = {
        let button = NRButton(with: NRConstants.Settings.resetButton, style: .danger)
        button.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var contentLabel: NRLabel = {
        let label = NRLabel()
        label.text = dataReset == .workoutHistory ? NRConstants.Settings.RowTitles.workoutHistory : NRConstants.Settings.RowTitles.statistics
        return label
    }()
    
    private var dataReset: DataReset = .none

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(for dataReset: DataReset) {
        self.selectionStyle = .none
        self.dataReset = dataReset
        
        contentView.addSubview(contentLabel)
        contentView.addSubview(resetButton)
        
        let width = contentView.frame.width * 0.5
        resetButton.anchor(top: nil, leading: nil, bottom: nil, trailing: contentView.trailingAnchor, centerY: contentView.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .defaultPadding), size: CGSize(width: width, height: 40))
        
        contentLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: .leadingPaddingCell, bottom: 0, right: 0))
    }
    
    @objc private func resetTapped() {
        let resetAction = ResetDataAction(dataReset: dataReset)
        store.dispatch(resetAction)
        
        let invalidateAction = InvalidateResetDataAction()
        store.dispatch(invalidateAction)
    }

}
