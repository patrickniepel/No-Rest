//
//  StatisticsGeneralCollectionViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class StatisticsStatsCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let stats: [Stat]
    
    init(stats: [Stat]) {
        self.stats = stats
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.statisticsStatsCollectionViewCell, for: indexPath) as? StatisticsStatsCollectionViewCell
        
//        let currentStat = stats[indexPath.item]
        cell?.setup()
        
        return cell ?? UICollectionViewCell()
    }
}
