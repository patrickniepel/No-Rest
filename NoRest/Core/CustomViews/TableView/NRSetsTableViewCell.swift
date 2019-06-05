//
//  NRSetsTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NRSetsTableViewCell: UITableViewCell {
    
    private let repsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.textAlignment = .center
        label.font = UIFont(name: NRConstants.Font.fontBold, size: .fontSizeMedium)
        return label
    }()
    
    private let xImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = NRConstants.Images.x.image?.dye(.black)
        return imageView
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.textAlignment = .center
        label.font = UIFont(name: NRConstants.Font.fontBold, size: .fontSizeMedium)
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
    
    func disableUserInteraction() {
        isUserInteractionEnabled = false
    }
}

private extension NRSetsTableViewCell {
    
    func setupLayout() {
        contentView.addSubviews(repsLabel, xImageView, weightLabel)
        
        let imageWidth: CGFloat = 15
            xImageView.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, centerX: contentView.centerXAnchor, size: CGSize(width: imageWidth, height: 0))
        
        repsLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: xImageView.leadingAnchor, padding: UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4))
        
        weightLabel.anchor(top: contentView.topAnchor, leading: xImageView.trailingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4))
    }
}
