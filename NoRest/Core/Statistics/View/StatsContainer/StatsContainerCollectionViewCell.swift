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
        cv.backgroundColor = .backgroundColorMain
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
    private var swipeGesture: UISwipeGestureRecognizer!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        currentStats = []
    }
    
    func setup(stats: [StatsContainerItem]) {
        currentStats = stats
        setupDesign()
        setupLayout()
        setupSwipeGesture()
        statsCollectionView.delegate = self
        statsCollectionView.dataSource = self
    }
    
    private func setupDesign() {
        contentView.backgroundColor = .backgroundColorMain
    }
    
    private func setupLayout() {
        contentView.addSubview(statsCollectionView)
        
        statsCollectionView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    func scrollToSection(_ searchText: String) {
        guard let index = currentStats.firstIndex(where: { $0.title.lowercased().contains(searchText.lowercased()) }) else { return }
        
        let indexPath = IndexPath(item: 0, section: index)
        statsCollectionView.scrollToItem(at: indexPath, at: .top, animated: true)
    }
    
    deinit {
        statsCollectionView.removeGestureRecognizer(swipeGesture)
    }
}

extension StatsContainerCollectionViewCell: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    private func setupSwipeGesture() {
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeGesture.delegate = self
        swipeGesture.direction = .left
        statsCollectionView.addGestureRecognizer(swipeGesture)
    }
    
    @objc private func handleSwipe(swipe: UISwipeGestureRecognizer) {
        print("Touch \(statsCollectionView.visibleCells.count)")
        
        let location = swipe.location(in: contentView)
        if let statisticsVC = self.presentingViewController as? StatisticsViewController,
            let topIndexPath = statisticsVC.statisticsCollectionView.indexPath(for: self),
            topIndexPath.item == 0, //If its the general cell
            let indexPath = statsCollectionView.indexPathForItem(at: location),
            let category = Category.allCategories[safe: indexPath.section],
            category != .none { //Skip general category
            
            print("")
            statisticsVC.injectExercisesStats(for: category)
        }
    }
}
