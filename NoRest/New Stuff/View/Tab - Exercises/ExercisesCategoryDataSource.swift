//
//  ExercisesCategoryDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesCategoryDataSource: NSObject, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DefaultCategory.allCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.exercisesCategoryCollectionViewCell, for: indexPath) as? ExercisesCategoryCollectionViewCell
        
        let cellTitle = DefaultCategory.allCategories[indexPath.row].rawValue
        cell?.setupCell(with: cellTitle)
        
        return cell ?? UICollectionViewCell()
    }
}
