//
//  ExerciseStatisticExerciseDataSource.swift
//  Push
//
//  Created by Patrick Niepel on 21.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class ExerciseStatisticExerciseDataSource: NSObject, UICollectionViewDataSource {
    
    var exercises : [Exercise] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exerciseStatisticCell", for: indexPath) as! ExerciseStatisticExerciseCollectionViewCell
        
        cell.exercise.text = exercises[indexPath.item].name
        return cell
    }
}
