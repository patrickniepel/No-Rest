//
//  HistoryDetailCollectionViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension HistoryDetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myWorkout?.exercises.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.historyDetailCollectionViewCell, for: indexPath) as? HistoryDetailCollectionViewCell
        
        if let exercise = myWorkout?.exercises[safe: indexPath.item] {
            cell?.setup(with: exercise)
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    
}
