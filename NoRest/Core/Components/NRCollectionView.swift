//
//  NRCollectionView.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRCollectionView: UICollectionView {
    private let scrollDirection: UICollectionView.ScrollDirection
    
    init(scrollDirection: UICollectionView.ScrollDirection) {
        self.scrollDirection = scrollDirection
        super.init(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = NRStyle.themeColor
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        isPagingEnabled = true
        
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = scrollDirection
        }
    }
}
