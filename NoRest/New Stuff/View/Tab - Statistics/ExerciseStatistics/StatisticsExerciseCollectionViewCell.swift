//
//  StatisticsExerciseCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class StatisticsExerciseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        setupDesign()
        setupLayout()
    }
    
    private func setupDesign() {
        contentView.backgroundColor = .lightBackgroundColor
        contentView.layer.cornerRadius = 25
        contentView.applyShadow()
    }
    
    private func setupLayout() {
        
    }
}
