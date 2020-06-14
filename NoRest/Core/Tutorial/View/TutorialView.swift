//
//  TutorialView.swift
//  NoRest
//
//  Created by Patrick Niepel on 14.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class TutorialView: UIView {
    private lazy var collectionView: NRCollectionView = .init(scrollDirection: .horizontal)
    
    private lazy var pageControl: NRPageControl = {
        let pageControl = NRPageControl()
        pageControl.numberOfPages = tutorialCtrl.numberOfTutorialPages()
        return pageControl
    }()
    
    private lazy var finishButton: NRButton = {
        let button = NRButton()
        button.setTitle("tutorial.finish".localized, for: .normal)
        return button
    }()
    
    private var currentPage = 0
    private let tutorialCtrl: TutorialController
    private let showFinishButton: Bool
    
    init(showFinishButton: Bool) {
        self.showFinishButton = showFinishButton
        tutorialCtrl = TutorialController()
        
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
        pageControl.anchor(top: collectionView.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, centerX: centerXAnchor, padding: .init(top: 0, left: 0, bottom: NRStyle.verticalPadding, right: 0))
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TutorialCollectionViewCell.self, forCellWithReuseIdentifier: TutorialCollectionViewCell.reuseIdentifier)
    }
    
    private func updatePage(page: Int) {
        pageControl.currentPage = page
        currentPage = page
        
        if currentPage == pageControl.numberOfPages - 1 {
            addFinishButton()
        } else {
            removeFinishButton()
        }
    }
    
    private func addFinishButton() {
        pageControl.removeConstraints(pageControl.constraints)
        pageControl.anchor(top: collectionView.bottomAnchor, centerX: centerXAnchor, padding: .init(top: 0, left: 0, bottom: NRStyle.verticalPadding, right: 0))
        
        addSubview(finishButton)
        finishButton.anchor(top: pageControl.bottomAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: NRStyle.horizontalPadding * 2, bottom: NRStyle.verticalPadding, right: NRStyle.horizontalPadding * 3), size: .init(width: 0, height: 50))
    }
    
    private func removeFinishButton() {
        finishButton.removeFromSuperview()
        pageControl.removeConstraints(pageControl.constraints)
        pageControl.anchor(top: collectionView.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, centerX: centerXAnchor, padding: .init(top: 0, left: 0, bottom: NRStyle.verticalPadding, right: 0))
        layoutIfNeeded()
    }
    
    @objc
    func finishTutorial() {
        let routeAction = RouteAction(screen: .tabBar, in: .workouts)
        store.dispatch(routeAction)
    }
}

extension TutorialView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tutorialCtrl.numberOfTutorialPages()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TutorialCollectionViewCell.reuseIdentifier, for: indexPath) as! TutorialCollectionViewCell
        let tutorialPage = tutorialCtrl.tutorialPage(for: indexPath.item)
        cell.setup(with: tutorialPage, showFinishButton: indexPath.item == tutorialCtrl.numberOfTutorialPages() - 1)
        
        return cell
    }
}

extension TutorialView: UICollectionViewDelegateFlowLayout {
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
