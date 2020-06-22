//
//  NRCollectionView.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRCollectionView: UICollectionView, Themeable {
    typealias Theme = CollectionViewTheme

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
        self.observe(theme: \ApplicationTheme.native.collectionViewTheme)

        isPagingEnabled = true

        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = scrollDirection
        }
    }

    func apply(theme: Theme) {
        backgroundColor = theme.backgroundColor
    }
}
