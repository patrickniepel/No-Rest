//
//  NRButton.swift
//  NoRest
//
//  Created by Patrick Niepel on 14.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRButton: UIButton {
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setTitleColor(NRStyle.offWhiteColor, for: .normal)
        backgroundColor = NRStyle.interactionColor

        layer.cornerRadius = 10
        applyShadow()
    }
}
