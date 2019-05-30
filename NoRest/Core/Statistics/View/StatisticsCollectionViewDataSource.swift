//
//  StatisticsCollectionViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension StatisticsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.statsContainerCollectionViewCell, for: indexPath) as? StatsContainerCollectionViewCell
        
        let statsType = StatsType(rawValue: indexPath.item) ?? .general
        if let statsToLoad = stats[statsType] {
            cell?.setup(stats: statsToLoad)
        }
        
        return cell ?? UICollectionViewCell()
    }
}
