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
        font = UIFont(name: NRConstants.Font.font, size: .fontSizeRegular)
        setup()
    }

    init(frame: CGRect = CGRect(), with title: String, size: CGFloat = .fontSizeRegular) {
        super.init(frame: frame)
        text = title
        font = UIFont(name: NRConstants.Font.font, size: size)
        setup()
    }
    
    private func setup() {
        textColor = .textColor
        textAlignment = .left
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func makeBold() {
        font = UIFont(name: NRConstants.Font.fontBold, size: font.pointSize)
    }
}
