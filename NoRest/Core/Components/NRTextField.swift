//
//  NRTextField.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class NRTextField: UITextField {
    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = NRStyle.primaryTextColor
        textColor = NRStyle.themeColor
        tintColor = NRStyle.themeColor
        borderStyle = .roundedRect
        keyboardAppearance = .dark
        font = UIFont(name: NRStyle.boldFont, size: NRStyle.fontSizeRegular)
        applyShadow()
    }
}
