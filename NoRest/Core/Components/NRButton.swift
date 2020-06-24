//
//  NRButton.swift
//  NoRest
//
//  Created by Patrick Niepel on 14.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRButton: UIButton, Themeable {
    typealias Theme = ButtonTheme

    override init(frame: CGRect = CGRect()) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.observe(theme: \ApplicationTheme.native.buttonTheme)
        layer.cornerRadius = 10
        applyShadow()
    }

    func apply(theme: Theme) {
        setTitleColor(theme.titleColor, for: .normal)
        backgroundColor = theme.backgroundColor
    }
}
