//
//  IconSelectionView.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class IconSelectionView: UIView {
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = true
        cv.backgroundColor = NRStyle.themeColor
        cv.register(IconSelectionCollectionViewCell.self, forCellWithReuseIdentifier: IconSelectionCollectionViewCell.reuseIdentifier)
        
        if let layout = cv.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        
        return cv
    }()
    
    var currentSelectionIcon: UIImage?
    
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        subscribe()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(collectionView)
        collectionView.fillSuperview()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    deinit {
        unsubscribe()
    }
}

extension IconSelectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CustomIcons.allIcons().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IconSelectionCollectionViewCell.reuseIdentifier, for: indexPath) as! IconSelectionCollectionViewCell
        let icon = CustomIcons.allIcons()[indexPath.item]
        cell.setup(with: icon, isSelected: icon == currentSelectionIcon)
        return cell
    }
}

extension IconSelectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedIcon = CustomIcons.allIcons()[indexPath.item],
            let presentingViewController = collectionView.presentingViewController as? IconSelectionViewController else { return }
        
        let iconSelectionAction = IconSelectionAction(icon: selectedIcon)
        store.dispatch(iconSelectionAction)
        
        presentingViewController.dismissIconSelection()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.width / 3 - NRStyle.verticalPadding / 4
        return .init(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return NRStyle.verticalPadding / 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return NRStyle.verticalPadding / 4
    }
}
