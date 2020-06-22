//
//  NRCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRCollectionViewCell: UICollectionViewCell, Themeable {
    typealias Theme = CollectionViewCellTheme

    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        self.observe(theme: \ApplicationTheme.native.collectionViewCellTheme)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func apply(theme: Theme) {
        backgroundColor = theme.backgroundColor
    }
}
