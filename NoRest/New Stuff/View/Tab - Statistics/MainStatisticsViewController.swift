//
//  MainStatisticsViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class MainStatisticsViewController: UIViewController {
    
    let mainStatisticsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        cv.setupDefaultBackgroundColor()
        cv.register(StatisticsGeneralCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.statisticsGeneralCollectionViewCell)
        cv.register(StatisticsExerciseCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.statisticsExerciseCollectionViewCell)
        cv.isScrollEnabled = true
        cv.isPagingEnabled = true
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        
        if let layout = cv.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        return cv
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .textColorMediumLight
        pageControl.currentPageIndicatorTintColor = .textColorLight
        return pageControl
    }()
    
    private var dataSource: MainStatisticsCollectionViewDataSource?
    private var delegate: MainStatisticsCollectionViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.setupDefaultBackgroundColor()
        navigationItem.title = NRConstants.ScreenTitles.statistics
        
        dataSource = MainStatisticsCollectionViewDataSource()
        delegate = MainStatisticsCollectionViewDelegate()
        
        mainStatisticsCollectionView.dataSource = dataSource
        mainStatisticsCollectionView.delegate = delegate
        
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(mainStatisticsCollectionView)
        view.addSubview(pageControl)
        
        if #available(iOS 11.0, *) {
            pageControl.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: nil, centerX: true)
        } else {
            pageControl.anchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: nil, centerX: true)
        }
        
        mainStatisticsCollectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: pageControl.topAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0))
    }
    
    func updatePageControl(page: Int) {
        pageControl.currentPage = page
    }
}
