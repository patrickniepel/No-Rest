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
        cv.backgroundColor = .backgroundColorMain
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
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundColorUIControl
        return view
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
        
        backgroundColor = .backgroundColorMain
        contentView.backgroundColor = .backgroundColorMain
        
        historyCollectionView.dataSource = self
        historyCollectionView.delegate = self
        
        setupCollectionViewLayout()
    }
    
    private func setupCollectionViewLayout() {
        contentView.addSubviews(historyCollectionView, separator)
        
        separator.anchor(leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8), size: CGSize(width: 0, height: 1))
        historyCollectionView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: separator.topAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }

}
