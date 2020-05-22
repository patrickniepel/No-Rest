//
//  NREmptyCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 20.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NREmptyCollectionViewCell: UICollectionViewCell {
    
    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: NRConstants.Font.fontBold, size: 30)
        label.textColor = NRStyle.primaryTextColor
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        emptyLabel.text = nil
    }
    
    func setup(with title: String) {
        emptyLabel.text = title
        
        contentView.addSubviews(emptyLabel)
        emptyLabel.fillSuperview(padding: UIEdgeInsets(top: 64, left: 64, bottom: 64, right: 64))
    }
}
