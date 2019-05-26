//
//  CurrentWorkoutCollectionViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class CurrentWorkoutCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var exercises: [Exercise]
    
    init(exercises: [Exercise]) {
        self.exercises = exercises
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.currentWorkoutCollectionViewCell, for: indexPath) as? CurrentWorkoutCollectionViewCell
        
        if let exercise = exercises[safe: indexPath.item] {
            cell?.setup(exercise: exercise)
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    func updateExercise(at index: Int, exercise: Exercise) {
        exercises.remove(at: index)
        exercises.insert(exercise, at: index)
    }
}
