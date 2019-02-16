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
        return myWorkoutController.workoutCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.myWorkoutCollectionViewCell, for: indexPath) as? MyWorkoutCollectionViewCell
        let currentWorkout = myWorkoutController.allWorkouts()[indexPath.item]
        cell?.setup(for: currentWorkout)
        
        return cell ?? UICollectionViewCell()
    }
}
