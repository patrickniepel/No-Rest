//
//  HistoryDetailSetsTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class HistoryDetailSetsTableViewCell: UITableViewCell {
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let repsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: NRConstants.Font.fontBold, size: .fontSizeMedium)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let xImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = NRConstants.Images.x.image?.dye(.black).withAlignmentRectInsets(UIEdgeInsets(top: -20, left: -20, bottom: -20, right: -20))
        return imageView
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: NRConstants.Font.fontBold, size: .fontSizeMedium)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        repsLabel.text = nil
        weightLabel.text = nil
    }
    
    func setup(with set: Set) {
        backgroundColor = .backgroundColorUIControl
        repsLabel.text = "\(set.reps)"
        weightLabel.text = "\(set.weight) \(SettingsController.currentUnit.rawValue)"
        
        setupLayout()
    }
}

private extension HistoryDetailSetsTableViewCell {
    
    func setupLayout() {
        contentView.addSubviews(repsLabel, xImageView, weightLabel)
        
        xImageView.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, centerX: contentView.centerXAnchor)
        xImageView.widthAnchor.constraint(equalTo: xImageView.heightAnchor)
        
        repsLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: xImageView.leadingAnchor)
        
        weightLabel.anchor(top: contentView.topAnchor, leading: xImageView.trailingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
    }
}
