//
//  SetsTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 29.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SetsTableViewCell: UITableViewCell {
    
    private let repsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont(name: NRConstants.Font.fontBold, size: .fontSizeMedium)
        label.textAlignment = .center
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont(name: NRConstants.Font.fontBold, size: .fontSizeMedium)
        label.textAlignment = .center
        return label
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        return stackView
    }()
    
    override func prepareForReuse() {
        repsLabel.text = nil
        weightLabel.text = nil
    }
    
    func setup(with set: Set) {
        accessoryType = .none
        backgroundColor = .backgroundColorUIControl
        setupLayout()
        
        repsLabel.text = "\(set.reps)"
        weightLabel.text = "\(set.weight)"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupDesign()
    }
    
    private func setupDesign() {
        
    }
    
    private func setupLayout() {
        contentView.addSubview(labelStackView)
        labelStackView.addArrangedSubviews(repsLabel, weightLabel)
        
        labelStackView.fillSuperview()
        repsLabel.anchor(top: labelStackView.topAnchor, bottom: labelStackView.bottomAnchor)
        weightLabel.anchor(top: labelStackView.topAnchor, bottom: labelStackView.bottomAnchor)
    }
}
