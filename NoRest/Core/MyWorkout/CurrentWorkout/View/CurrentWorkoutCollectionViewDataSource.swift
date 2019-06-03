//
//  CurrentWorkoutCollectionViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension CurrentWorkoutViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myWorkout?.exercises.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.currentWorkoutCollectionViewCell, for: indexPath) as? CurrentWorkoutCollectionViewCell
        
        if let exercise = myWorkout?.exercises[safe: indexPath.item] {
            cell?.setup(exercise: exercise)
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    func updateExercise(at index: Int, exercise: Exercise) {
        myWorkout?.exercises[index] = exercise
    }
}
