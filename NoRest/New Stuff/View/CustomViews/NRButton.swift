//
//  NRButton.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class NRButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        setTitleColor(.mainColor, for: .normal)
        backgroundColor = .white
        layer.cornerRadius = 25
        
        layer.shadowColor = UIColor.mainColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 10
        layer.masksToBounds = false
    }

}
