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
        font = UIFont(name: NRConstants.Text.font, size: .fontSizeRegular)
        setup()
    }

    init(frame: CGRect = CGRect(), with title: String, size: CGFloat = .fontSizeRegular) {
        super.init(frame: frame)
        text = title
        font = UIFont(name: NRConstants.Text.font, size: size)
        setup()
    }
    
    private func setup() {
        textColor = .textColor
        textAlignment = .left
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func makeBold(with size: CGFloat = .fontSizeRegular) {
        font = UIFont(name: NRConstants.Text.fontBold, size: size)
    }
}
