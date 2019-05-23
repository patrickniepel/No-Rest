//
//  StatisticsCollectionViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class StatisticsCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var generalStats: [String: [Stat]] = [:]
    var exercisesStats: [String: [Stat]] = [:]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.statsContainerCollectionViewCell, for: indexPath) as? StatsContainerCollectionViewCell
        
        if indexPath.item == 0 {
            cell?.setup(stats: generalStats as Dictionary<String, Any>)
        } else {
            cell?.setup(stats: exercisesStats as Dictionary<String, Any>)
        }
        
        return cell ?? UICollectionViewCell()
    }
}
