//
//  StatsContainerCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class StatsContainerCollectionViewCell: UICollectionViewCell {

    let statsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = NRStyle.themeColor
        cv.register(StatsCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.statsCollectionViewCell)
        cv.register(StatsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NRConstants.CellIdentifiers.statsHeaderView)
        cv.isScrollEnabled = true
        cv.isPagingEnabled = false
        cv.showsVerticalScrollIndicator = true
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)

        if let layout = cv.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        return cv
    }()
    
    let padding: CGFloat = NRConstants.Padding.collectionViewItem
    var currentStats: [StatsContainerItem] = []
    
    override func prepareForReuse() {
        super.prepareForReuse()
        currentStats = []
        statsCollectionView.reloadData()
    }
    
    func setup(stats: [StatsContainerItem]) {
        currentStats = stats
        setupDesign()
        setupLayout()
        statsCollectionView.delegate = self
        statsCollectionView.dataSource = self
    }
    
    private func setupDesign() {
        contentView.backgroundColor = NRStyle.themeColor
    }
    
    private func setupLayout() {
        contentView.addSubview(statsCollectionView)
        
        statsCollectionView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    func scrollToSection(_ searchText: String) {
        guard let index = currentStats.firstIndex(where: { $0.title.lowercased().contains(searchText.lowercased()) }) else { return }
        
        let indexPath = IndexPath(item: 0, section: index)
        
        if let attributes = statsCollectionView.collectionViewLayout.layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, at: indexPath) {
            
            statsCollectionView.setContentOffset(CGPoint(x: 0, y: attributes.frame.origin.y), animated: true)
        } else {
            statsCollectionView.scrollToItem(at: indexPath, at: .top, animated: true)
        }
    }
}
