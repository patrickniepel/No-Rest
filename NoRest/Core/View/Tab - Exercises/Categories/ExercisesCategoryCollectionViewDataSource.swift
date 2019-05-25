//
//  ExercisesCategoryDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCategoryCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Category.allMuscleCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.exercisesCategoryCollectionViewCell, for: indexPath) as? ExercisesCategoryCollectionViewCell
        
        if let cellTitle = Category.allMuscleCategories[safe: indexPath.row]?.rawValue {
            cell?.setupCell(with: cellTitle)
        }
        
        return cell ?? UICollectionViewCell()
    }
}
