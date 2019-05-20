//
//  SelectorView.swift
//  NoRest
//
//  Created by Patrick Niepel on 11.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class SelectorView: UIView {
    
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .backgroundColorUIControl
        cv.register(SelectorCollectionViewCell.self, forCellWithReuseIdentifier: NRConstants.CellIdentifiers.statisticsStatsCollectionViewCell)
        cv.isScrollEnabled = false
        cv.isPagingEnabled = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        
        if let layout = cv.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        return cv
    }()
    
    let previousItemButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let nextItemButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private var items: [String]?
    private var baseView: UIView?
    private let uiElementsHeight: CGFloat = 50

    init(frame: CGRect = CGRect(), baseView: UIView) {
        let frame = CGRect(x: 0, y: 0, width: baseView.frame.width, height: uiElementsHeight)
        super.init(frame: frame)
        self.baseView = baseView
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        backgroundColor = .backgroundColorUIControl
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(collectionView)
        addSubview(previousItemButton)
        addSubview(nextItemButton)
    }
    
    func injectItems(_ items: [String]) {
        self.items = items
        collectionView.reloadData()
    }
}

extension SelectorView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NRConstants.CellIdentifiers.statisticsSelectorCollectionViewCell, for: indexPath) as? SelectorCollectionViewCell
        
        let itemTitle = items?[indexPath.item] ?? "Error"
        cell?.setup(with: itemTitle)
        return cell ?? UICollectionViewCell()
    }
}

extension SelectorView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

class SelectorCollectionViewCell: UICollectionViewCell {
    
    let contentLabel: NRLabel = {
        let label = NRLabel(with: "")
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(with title: String) {
        contentLabel.text = title
        
        contentView.addSubview(contentLabel)
        contentLabel.anchor(top: contentView.topAnchor
            , leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
    }
}
