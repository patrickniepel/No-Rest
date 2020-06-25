//
//  IconSelectionCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class IconSelectionCollectionViewCell: NRCollectionViewCell {
    private lazy var iconImageView: NRImageView = .init()

    private var didSelect = false

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
    }

    func setup(with icon: UIImage?, isSelected: Bool) {
        didSelect = isSelected
        iconImageView.image = icon

        contentView.addSubview(iconImageView)
        iconImageView.fillSuperview()

        contentView.layer.cornerRadius = 10

        if didSelect {
            contentView.layer.borderWidth = 2
        }
    }

    override func apply(theme: CollectionViewCellTheme) {
        contentView.backgroundColor = theme.offWhiteColor

        if didSelect {
            contentView.layer.borderColor = theme.accentuationColor.cgColor
        }
    }
}
