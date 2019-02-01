//
//  SettingsYourDataTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SettingsYourDataTableViewCell: UITableViewCell {
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle(NRConstants.Settings.deleteButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .danger
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
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
        
        if dataReset == .workoutHistory {
            textLabel?.text = NRConstants.Settings.RowTitles.workoutHistory
        } else if dataReset == .statistics {
            textLabel?.text = NRConstants.Settings.RowTitles.statistics
        }
        
        setupResetButton()
    }
    
    private func setupResetButton() {
        contentView.addSubview(resetButton)
        let width = contentView.frame.width * 0.5
        resetButton.anchor(top: nil, leading: nil, bottom: nil, trailing: contentView.trailingAnchor, centerY: true, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: NRConstants.Insets.default), size: CGSize(width: width, height: 40))
    }
    
    @objc private func resetButtonTapped() {
        let resetAction = ResetDataAction(dataReset: dataReset)
        store.dispatch(resetAction)
        
        let invalidateAction = InvalidateResetDataAction()
        store.dispatch(invalidateAction)
    }

}
