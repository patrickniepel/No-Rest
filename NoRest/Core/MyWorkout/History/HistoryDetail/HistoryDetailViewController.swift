//
//  HistoryDetailViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class HistoryDetailViewController: UIViewController {
    
    private let nameLabel: NRLabel = {
        let label = NRLabel(size: .fontSizeMedium)
        label.textAlignment = .center
        return label
    }()
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .backgroundColorMain
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        return collectionView
    }()
    
    private let pageControl = UIPageControl()
    private var currentPage = 0
    
    var myWorkout: MyWorkout?

    override func viewDidLoad() {
        super.viewDidLoad()

        subscribe()
        
        setupScreen()
        setupLayout()
        setupNameLabel()
        setupCollectionView()
        setupPageControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    private func setupScreen() {
        view.backgroundColor = .backgroundColorMain
        guard let workout = myWorkout, let date = workout.date else { return }
        navigationItem.title = Date.withFormat(date: date, format: NRConstants.Date.defaultFormat)
    }
    
    private func setupNameLabel() {
        nameLabel.text = myWorkout?.name
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HistoryDetailCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.historyDetailCollectionViewCell)
    }
    
    private func updateView() {
        //History was deleted
        if !HistoryController().isHistoryAvailabel(for: myWorkout) {
            navigationController?.popViewController(animated: true)
            return
        }
        
        updatePageControl(page: currentPage)
        collectionView.reloadData()
        
        let pageIndex = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: pageIndex, at: .centeredHorizontally, animated: true)
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = myWorkout?.exercises.count ?? 0
        pageControl.currentPageIndicatorTintColor = .uiControl
        pageControl.pageIndicatorTintColor = .backgroundColorUIControl
        pageControl.isUserInteractionEnabled = false
    }
    
    func updatePageControl(page: Int) {
        pageControl.currentPage = page
        currentPage = page
    }
    
    deinit {
        unsubscribe()
    }
}

private extension HistoryDetailViewController {
    
    func setupLayout() {
        view.addSubviews(nameLabel, collectionView, pageControl)
        
        nameLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16), size: CGSize(width: 0, height: 30))
        
        pageControl.anchor(bottom: view.layoutGuide().bottomAnchor, centerX: view.centerXAnchor)
        
        collectionView.anchor(top: nameLabel.bottomAnchor, leading: view.leadingAnchor, bottom: pageControl.topAnchor, trailing: view.trailingAnchor)
    }
}
