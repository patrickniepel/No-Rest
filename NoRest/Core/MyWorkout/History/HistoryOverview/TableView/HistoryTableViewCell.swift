//
//  HistoryTableViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 28.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    let historyCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .backgroundColorUIControl
        cv.register(HistoryCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.historyCollectionViewCell)
        cv.isScrollEnabled = true
        cv.isPagingEnabled = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = true
        
        if let layout = cv.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        return cv
    }()
    
    var workouts: [MyWorkout] = []

    override func prepareForReuse() {
        super.prepareForReuse()
        workouts = []
    }
    
    func setup(for workouts: [MyWorkout]) {
        self.workouts = workouts.sorted(by: { (lhs, rhs) -> Bool in
            guard let date0 = lhs.date, let date1 = rhs.date else { return false}
            return date0 > date1
        })
        
        backgroundColor = .backgroundColorUIControl
        contentView.backgroundColor = .backgroundColorUIControl
        
        historyCollectionView.dataSource = self
        historyCollectionView.delegate = self
        
        setupCollectionViewLayout()
    }
    
    private func setupCollectionViewLayout() {
        addSubview(historyCollectionView)
        historyCollectionView.fillSuperview()
    }

}
