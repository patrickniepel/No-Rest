//
//  WorkoutSessionView.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSessionView: UIView {
    private lazy var collectionView: NRCollectionView = .init(scrollDirection: .horizontal)
    
    private lazy var pageControl: NRPageControl = {
        let pageControl = NRPageControl()
        pageControl.numberOfPages = workout.exercises.count
        return pageControl
    }()
    
    private let workout: Workout
    private var currentPage = 0
    
    init(workout: Workout) {
        self.workout = workout
        super.init(frame: CGRect())
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupView()
        setupCollectionView()
    }
    
    private func setupView() {
        [collectionView, pageControl].forEach(addSubview)
        
        collectionView.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        pageControl.anchor(top: collectionView.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, centerX: centerXAnchor, padding: .init(top: NRStyle.verticalPadding, left: 0, bottom: NRStyle.verticalPadding, right: 0))
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(WorkoutSessionCollectionViewCell.self, forCellWithReuseIdentifier: WorkoutSessionCollectionViewCell.reuseIdentifier)
    }
    
    private func updatePage(page: Int) {
        pageControl.currentPage = page
        currentPage = page
    }
}

extension WorkoutSessionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workout.exercises.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutSessionCollectionViewCell.reuseIdentifier, for: indexPath) as! WorkoutSessionCollectionViewCell
        if let exercise = workout.exercises[safe: indexPath.item] {
            cell.setup(with: exercise)
        }
        
        return cell
    }
}

extension WorkoutSessionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let cell = collectionView.visibleCells.first,
            let indexPath = collectionView.indexPath(for: cell) {
            
            updatePage(page: indexPath.item)
        }
    }
}
