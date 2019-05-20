//
//  ExercisesCollectionViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let category: Category?
    let exerciseCtrl = ExerciseController()
    
    init(for category: Category?) {
        self.category = category
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if exercisesCount() == 0 {
            return 1
        }
        return exerciseCtrl.exercisesCount(for: category)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if exercisesCount() == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.emptyCollectionViewCell, for: indexPath) as? NREmptyCollectionViewCell

            cell?.setup(with: NRConstants.Texts.emptyExercises)
            return cell ?? UICollectionViewCell()
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.exercisesCollectionViewCell, for: indexPath) as? ExercisesCollectionViewCell
            
            if let exercise = category?.exercises[safe: indexPath.item] {
                cell?.setup(for: exercise)
            }
            
            return cell ?? UICollectionViewCell()
        }
    }
    
    func exercisesCount() -> Int {
        return exerciseCtrl.exercisesCount(for: category)
    }
}
