//
//  MyWorkoutCollectionViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class MyWorkoutCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let myWorkoutController = MyWorkoutController()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if myWorkoutController.workoutCount() == 0 {
            return 1
        }
        return myWorkoutController.workoutCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if myWorkoutController.workoutCount() == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.emptyCollectionViewCell, for: indexPath) as? NREmptyCollectionViewCell
            cell?.setup(with: NRConstants.Texts.emptyWorkouts)
            return cell ?? UICollectionViewCell()
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.myWorkoutCollectionViewCell, for: indexPath) as? MyWorkoutCollectionViewCell
            if let currentWorkout = myWorkoutController.allWorkouts()[safe: indexPath.item] {
                cell?.setup(for: currentWorkout)
            }
            
            return cell ?? UICollectionViewCell()
        }
    }
}
