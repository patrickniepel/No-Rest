//
//  MainStatisticsCollectionViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class MainStatisticsCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 { // General
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.statisticsGeneralCollectionViewCell, for: indexPath) as? StatisticsGeneralCollectionViewCell
            cell?.setup()
            return cell ?? UICollectionViewCell()
            
        } else { // Exercise
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.statisticsExerciseCollectionViewCell, for: indexPath) as? StatisticsExerciseCollectionViewCell
            cell?.setup()
            return cell ?? UICollectionViewCell()
        }
    }
}
