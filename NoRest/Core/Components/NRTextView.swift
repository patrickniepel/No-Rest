//
//  NRTextView.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRTextView: UITextView, Themeable {
    typealias Theme = TextViewTheme

    override init(frame: CGRect = CGRect(), textContainer: NSTextContainer? = nil) {
        super.init(frame: frame, textContainer: textContainer)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.observe(theme: \ApplicationTheme.native.textViewTheme)

        layer.cornerRadius = 7
        keyboardAppearance = .dark
        applyShadow()
    }

    func apply(theme: Theme) {
        backgroundColor = theme.backgroundColor
        tintColor = theme.themeColor
        textColor = theme.themeColor
        font = theme.textFont
    }
}
