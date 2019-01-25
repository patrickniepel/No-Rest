//
//  CurrentWorkoutDataSource.swift
//  Push
//
//  Created by Patrick Niepel on 18.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class CurrentWorkoutDataSource: NSObject, UICollectionViewDataSource {
    
    var exercises : [Exercise] = []

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if exercises[indexPath.item].category == "Cardio" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currentWorkoutCardioCell", for: indexPath) as? CurrentWorkoutCardioCollectionViewCell
            cell?.setup(collectView: collectionView, exercise: exercises[indexPath.item])
            return cell ?? UICollectionViewCell()
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currentWorkoutCell", for: indexPath) as? CurrentWorkoutCollectionViewCell
            cell?.setup(collectView: collectionView, exercise: exercises[indexPath.item])
            return cell ?? UICollectionViewCell()
        }
    }
}
