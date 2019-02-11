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
    
    init(for category: Category?) {
        self.category = category
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.exercises.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.exercisesCollectionViewCell, for: indexPath) as? ExercisesCollectionViewCell
        
        if let exercise = category?.exercises.sorted()[indexPath.item] {
            cell?.setup(for: exercise)
        }
        
        return cell ?? UICollectionViewCell()
    }
}
