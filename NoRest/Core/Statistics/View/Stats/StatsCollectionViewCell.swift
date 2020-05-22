//
//  StatsCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class StatsCollectionViewCell: UICollectionViewCell {
    
    let statsTitleLabel: NRLabel = {
        let label = NRLabel()
        label.textColor = NRStyle.secondaryTextColor
        return label
    }()
    
    let statsValueLabel: NRLabel = {
        let label = NRLabel()
        label.textColor = NRStyle.primaryTextColor
        label.textAlignment = .center
        label.font = UIFont(name: NRStyle.boldFont, size: NRStyle.fontSizeLarge)
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        statsValueLabel.text = nil
    }
    
    func setup(with stat: Stat) {
        statsTitleLabel.text = stat.title.rawValue
        
        let valueString = stat.type == .nonDecimal ? "\(Int(stat.value))" : String(format: "%.2f", stat.value)
        statsValueLabel.text = "\(valueString) \(stat.title.unit)"
        
        setupDesign()
        setupLayout()
    }
    
    private func setupDesign() {
        contentView.backgroundColor = NRStyle.themeColor
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 15
        applyShadow()
    }
    
    private func setupLayout() {
        contentView.addSubviews(statsTitleLabel, statsValueLabel)
        
        statsTitleLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16), size: CGSize(width: 0, height: contentView.bounds.height * 0.33))
        
        statsValueLabel.anchor(top: statsTitleLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 8, right: 16))
    }
}
