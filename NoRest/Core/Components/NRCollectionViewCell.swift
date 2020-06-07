//
//  NRCollectionViewCell.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        backgroundColor = NRStyle.themeColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
