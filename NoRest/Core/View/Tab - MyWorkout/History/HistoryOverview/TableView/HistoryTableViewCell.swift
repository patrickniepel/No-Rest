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
    
    private var dataSource: HistoryCollectionViewDataSource?
    private var delegate: HistoryCollectionViewDelegate?
    private var workouts: [MyWorkout] = []

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(for workouts: [MyWorkout]) {
        self.workouts = workouts
        contentView.backgroundColor = .backgroundColorUIControl
        dataSource = HistoryCollectionViewDataSource(workouts: workouts)
        delegate = HistoryCollectionViewDelegate()
        
        historyCollectionView.dataSource = dataSource
        historyCollectionView.delegate = delegate
        
        setupCollectionViewLayout()
    }
    
    private func setupCollectionViewLayout() {
        addSubview(historyCollectionView)
        historyCollectionView.fillSuperview()
    }

}
