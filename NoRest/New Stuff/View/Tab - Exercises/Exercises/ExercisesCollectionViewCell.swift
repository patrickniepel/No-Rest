//
//  ExercisesCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(for exercise: Exercise) {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 25
        contentView.layer.shadowColor = UIColor.mainColor.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 10)
        contentView.layer.shadowOpacity = 1.0
        contentView.layer.shadowRadius = 10
        contentView.layer.masksToBounds = false
        print("Exericse", exercise)
    }
}
