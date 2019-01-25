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
        layer.borderWidth = 3
        layer.borderColor = UIColor.mainColor.cgColor
    }

}
