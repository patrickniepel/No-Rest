//
//  StatsCollectionViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension StatsContainerCollectionViewCell: UICollectionViewDataSource  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return currentStats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentStats[safe: section]?.stats.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.statsCollectionViewCell, for: indexPath) as? StatsCollectionViewCell
        
        if let statItem = currentStats[safe: indexPath.section],
            let stat = statItem.stats[safe: indexPath.item] {
            cell?.setup(with: stat)
        }
        
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NRConstants.CellIdentifiers.statsHeaderView, for: indexPath) as? StatsHeaderView
            
            let title = currentStats[safe: indexPath.section]?.title ?? ""
            header?.setup(with: title)
            
            return header ?? UICollectionReusableView()
        }
        
        return UICollectionReusableView()
    }
}
