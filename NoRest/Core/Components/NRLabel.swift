//
//  NRLabel.swift
//  NoRest
//
//  Created by Patrick Niepel on 03.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NRLabel: UILabel {
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        font = UIFont(name: NRStyle.boldFont, size: NRStyle.fontSizeRegular)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(with title: String = "", size: CGFloat = NRStyle.fontSizeRegular) {
        self.init()
        text = title
        font = UIFont(name: NRStyle.boldFont, size: size)
        setup()
    }
    
    private func setup() {
        textColor = NRStyle.primaryTextColor
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
    }
}
