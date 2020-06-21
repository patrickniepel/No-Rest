//
//  IconSelectionCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class IconSelectionCollectionViewCell: UICollectionViewCell {
    private lazy var iconImageView: NRImageView = .init()

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
    }

    func setup(with icon: UIImage?, isSelected: Bool) {
        iconImageView.image = icon

        contentView.addSubview(iconImageView)
        iconImageView.fillSuperview()

        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = NRStyle.offWhiteColor

        if isSelected {
            contentView.layer.borderWidth = 2
            contentView.layer.borderColor = NRStyle.complementaryColor.cgColor
        }
    }
}
