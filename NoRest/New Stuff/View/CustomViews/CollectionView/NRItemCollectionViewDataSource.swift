//
//  NRItemCollectionViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NRItemCollectionViewDataSource<T>: NSObject, UICollectionViewDataSource {

    var items: [T] = []
    
    init(items: [T]) {
        self.items = items
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if items.count == 0 {
            return 1
        }
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if items.count == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.emptyCollectionViewCell, for: indexPath) as? NREmptyCollectionViewCell
            var title = ""
            if let _ = collectionView.presentingViewController as? MyWorkoutCollectionViewController {
                title = NRConstants.Texts.emptyWorkouts
            }
            else if let _ = collectionView.presentingViewController as? ExercisesCollectionViewController {
                title = NRConstants.Texts.emptyExercises
            }
            
            cell?.setup(with: title)
            return cell ?? UICollectionViewCell()
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.itemCollectionViewCell, for: indexPath) as? NRItemCollectionViewCell
            if let currentItem = items[safe: indexPath.item] {
                cell?.setup(item: currentItem)
            }
            
            return cell ?? UICollectionViewCell()
        }
    }
    
    func deleteItem(at index: Int) {
        items.remove(at: index)
    }
}
