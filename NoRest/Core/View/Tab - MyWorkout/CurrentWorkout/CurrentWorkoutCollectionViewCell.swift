//
//  CurrentWorkoutCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class CurrentWorkoutCollectionViewCell: UICollectionViewCell {
    
    private var exercise: Exercise?
    
    func setup(exercise: Exercise) {
        self.exercise = exercise
        backgroundColor = .yellow
    }
}
