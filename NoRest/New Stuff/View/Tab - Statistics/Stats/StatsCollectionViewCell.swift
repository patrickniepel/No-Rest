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
        let label = NRLabel(with: "")
        label.textColor = .textColor
        return label
    }()
    
    let statsValueLabel: NRLabel = {
        let label = NRLabel(with: "")
        label.textColor = .textColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
//        statsTitleLabel.text = stat.title
//        statsValueLabel.text = "\(stat.value)"
        
        setupDesign()
        setupLayout()
    }
    
    private func setupDesign() {
        contentView.backgroundColor = .red
    }
    
    private func setupLayout() {
        
    }
}
