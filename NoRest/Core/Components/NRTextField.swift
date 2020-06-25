//
//  NRTextField.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRTextField: UITextField, Themeable {
    typealias Theme = TextFieldTheme

    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.observe(theme: \ApplicationTheme.native.textFieldTheme)

        borderStyle = .roundedRect
        keyboardAppearance = .dark
        applyShadow()
    }

    func apply(theme: Theme) {
        backgroundColor = theme.backgroundColor
        textColor = theme.themeColor
        tintColor = theme.themeColor
        font = theme.textFont
    }
}
