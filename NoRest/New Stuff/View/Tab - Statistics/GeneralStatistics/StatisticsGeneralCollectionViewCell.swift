//
//  StatisticsGeneralCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class StatisticsGeneralCollectionViewCell: UICollectionViewCell {
    
    let statsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .backgroundColorUIControl
        cv.register(StatisticsStatsCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.statisticsStatsCollectionViewCell)
        cv.isScrollEnabled = true
        cv.isPagingEnabled = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false

        if let layout = cv.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        
        return cv
    }()
    
    private var dataSource: StatisticsStatsCollectionViewDataSource?
    private var delegate: StatisticsStatsCollectionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        let stats = StatisticsController.generalStats()
//        dataSource = StatisticsStatsCollectionViewDataSource(stats: stats)
//        delegate = StatisticsStatsCollectionViewDelegate()
//        statsCollectionView.dataSource = dataSource
//        statsCollectionView.delegate = delegate
        
        setupDesign()
        setupLayout()
    }
    
    private func setupDesign() {
        contentView.backgroundColor = .backgroundColorUIControl
    }
    
    private func setupLayout() {
        contentView.addSubview(statsCollectionView)
        
        statsCollectionView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
}
